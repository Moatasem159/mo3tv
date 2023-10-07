import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
class AccountCubit extends HydratedCubit<AccountStates> {
  AccountCubit(this._getAccountDetailsUsecase) : super(AccountInitialState());
  static AccountCubit get(context) => BlocProvider.of(context);
  final GetAccountDetailsUsecase _getAccountDetailsUsecase;
  Future<void> getAccountDetails() async {
    if(state is! GetAccountsDetailsSuccessState){
      emit(GetAccountsDetailsLoadingState());
      Either<Failure, Account> res = await _getAccountDetailsUsecase.call(sessionId: AppStrings.sessionId);
      res.fold(
          (l) => emit(GetAccountsDetailsErrorState(msg: mapFailureToMsg(l))),
          (account) async {
        emit(GetAccountsDetailsSuccessState(account,AppStrings.sessionId));
      });
    }
  }
  @override
  AccountStates? fromJson(Map<String, dynamic> json) {
    if(json["sessionId"]==AppStrings.sessionId) {
      return GetAccountsDetailsSuccessState.fromMap(json);
    }
    else{
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(AccountStates state) {
    if (state is GetAccountsDetailsSuccessState)
  {
    return state.toMap();
  }
    else {
      return null;
    }
  }
}