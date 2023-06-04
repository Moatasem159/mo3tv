import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_data_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/save_account_data_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
class AccountCubit extends Cubit<AccountStates> {
  AccountCubit(this._getAccountDetailsUsecase, this._saveAccountDataUsecase,
      this._getAccountDataUsecase)
      : super(AccountInitialState());
  static AccountCubit get(context) => BlocProvider.of(context);
  final GetAccountDetailsUsecase _getAccountDetailsUsecase;
  final SaveAccountDataUsecase _saveAccountDataUsecase;
  final GetAccountDataUsecase _getAccountDataUsecase;
  Future<void> getAccountDetails({required String sessionId}) async {
    if (sessionId != "") {
      emit(GetAccountsDetailsLoadingState());
      Either<Failure, Account> res =
          await _getAccountDetailsUsecase.call(sessionId: sessionId);
      res.fold(
          (l) => emit(GetAccountsDetailsErrorState(msg: mapFailureToMsg(l))),
          (account) async {
        await _saveAccountDataUsecase.call(
            sessionId: sessionId, accountId: account.id.toString());
        await _getAccountDataUsecase.call();
        emit(GetAccountsDetailsSuccessState(account));
      });
    }
  }
  bool isSuccess() {
    return state is GetAccountsDetailsSuccessState;
  }
  initial() {
    emit(AccountInitialState());
  }
}
