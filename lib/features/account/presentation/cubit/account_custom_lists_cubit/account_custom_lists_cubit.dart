import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_custom_lists_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_state.dart';
class AccountCustomListsCubit extends Cubit<AccountCustomListsStates> {
  AccountCustomListsCubit(this._getAccountCustomListsUseCase)
      : super(AccountCustomListsInitialState());
  final GetAccountCustomListsUseCase _getAccountCustomListsUseCase;
  static AccountCustomListsCubit get(context) => BlocProvider.of(context);
  Future<void> getAccountCustomLists(
      {required String sessionId, required String accountId}) async {
    emit(GetAccountCustomListsLoadingState());
    Either<Failure, List<AccountCustomMediaList>> response =
        await _getAccountCustomListsUseCase.call(
            sessionId: sessionId, accountId: accountId);
    emit(response.fold((l) => GetAccountCustomListsErrorState(),
        (r) => GetAccountCustomListsSuccessState(r)));
  }
  bool isSuccess(){
    return state is GetAccountCustomListsSuccessState;
  }
}