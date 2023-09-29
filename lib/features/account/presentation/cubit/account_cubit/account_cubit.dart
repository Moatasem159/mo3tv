import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/save_session_id_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
class AccountCubit extends Cubit<AccountStates> {
  AccountCubit(this._getAccountDetailsUsecase, this._saveAccountDataUsecase)
      : super(AccountInitialState());
  static AccountCubit get(context) => BlocProvider.of(context);
  final GetAccountDetailsUsecase _getAccountDetailsUsecase;
  final SaveSessionIdUsecase _saveAccountDataUsecase;
  Future<void> getAccountDetails({required String sessionId}) async {
    if (sessionId != "") {
      emit(GetAccountsDetailsLoadingState());
      Either<Failure, Account> res =
          await _getAccountDetailsUsecase.call(sessionId: sessionId);
      res.fold(
          (l) => emit(GetAccountsDetailsErrorState(msg: mapFailureToMsg(l))),
          (account) async {
        await _saveAccountDataUsecase.call(sessionId: sessionId);
        AppStrings.sessionId=sessionId;
        emit(GetAccountsDetailsSuccessState(account));
      });
    }
  }
  bool isSuccess() {
    return state is GetAccountsDetailsSuccessState;
  }
}
