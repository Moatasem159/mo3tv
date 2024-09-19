import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';

part 'account_state.dart';

class AccountCubit extends HydratedCubit<AccountStates> {
  AccountCubit(this._getAccountDetailsUsecase)
      : super(GetAccountsDetailsLoadingState());

  static AccountCubit get(context) => BlocProvider.of(context);
  final GetAccountDetailsUsecase _getAccountDetailsUsecase;

  Future<void> getAccountDetails() async {
    if (AppStrings.sessionId.isEmpty) {
      return emit(GetAccountsDetailsErrorState(msg: "No sessionId"));
    }
    if (state is! GetAccountsDetailsSuccessState) {
      ApiResult<Account> res =
          await _getAccountDetailsUsecase(sessionId: AppStrings.sessionId);
      switch (res) {
        case ApiSuccess<Account>():
          emit(GetAccountsDetailsSuccessState(res.data, AppStrings.sessionId));
        case ApiFailure<Account>():
          emit(GetAccountsDetailsErrorState(msg: mapFailureToMsg(res.failure)));
      }
    }
  }

  @override
  AccountStates? fromJson(Map<String, dynamic> json) {
    if (json["sessionId"] == AppStrings.sessionId) {
      return GetAccountsDetailsSuccessState.fromMap(json);
    } else {
      clear();
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AccountStates state) {
    if (state is GetAccountsDetailsSuccessState) {
      return state.toMap();
    } else {
      return null;
    }
  }
}