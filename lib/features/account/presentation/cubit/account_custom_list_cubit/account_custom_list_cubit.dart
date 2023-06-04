import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_custom_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_state.dart';
class AccountCustomListCubit extends Cubit<AccountCustomListStates> {
  AccountCustomListCubit(this._getAccountCustomListUseCase) : super(AccountCustomListInitialState());
  static AccountCustomListCubit get(context)=>BlocProvider.of(context);
  final GetAccountCustomListUseCase _getAccountCustomListUseCase;
  Future<void> getAccountCustomList({required String listId,required String sessionId})async{
    emit(GetAccountCustomListLoadingState());
    Either<Failure,AccountCustomMediaList> response =
    await _getAccountCustomListUseCase.call(sessionId: sessionId, listId: listId);
    emit(response.fold(
        (l) =>GetAccountCustomListErrorState(),
        (r) => GetAccountCustomListSuccessState(r)));
  }
}