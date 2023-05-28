import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
class AccountListsCubit extends Cubit<AccountListsStates> {
  AccountListsCubit(this._getAccountListsUsecase) : super(AccountListsInitialState());
  final GetAccountListsUsecase _getAccountListsUsecase;
  static AccountListsCubit get(context)=>BlocProvider.of(context);
  int page=0;
  int totalPage=0;
  int totalResult=0;
  List list=[];
  Future<void> getAccountList({required String listType,required String mediaType,int page=1,required String lang})async{
    emit(GetAccountListsLoadingState());
    Either<Failure, AccountListEntity> accountList =
    await _getAccountListsUsecase.call(listType: listType,mediaType: mediaType,page: page,lang: lang);
    accountList.fold((l){
      emit(GetAccountListsErrorState( msg: mapFailureToMsg(l)));
    },(r){
      this.page=r.page;
      totalResult=r.totalResults;
      totalPage=r.totalPages;
      list=r.list;
      emit(GetAccountListsSuccessState());
    });
  }
  update(){
    emit(UpdateListState());
  }
}
