import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
class AccountListsCubit extends Cubit<AccountListsStates> {
  AccountListsCubit(this._getAccountListsUsecase) : super(AccountListsInitialState());
  final GetAccountListsUsecase _getAccountListsUsecase;
  static AccountListsCubit get(context)=>BlocProvider.of(context);
  List list=[];
  Future<void> getAccountList({required String listType,required String mediaType})async{
    emit(GetAccountListsLoadingState());
    Either<Failure, List> accountList =await _getAccountListsUsecase.call(listType: listType,mediaType: mediaType);
    accountList.fold((l){
      emit(GetAccountListsErrorState( msg: mapFailureToMsg(l)));
    },(r){
      list.clear();
      list=r;
      emit(GetAccountListsSuccessState());
    });
  }
  update(){
    emit(UpdateListState());
  }
}
