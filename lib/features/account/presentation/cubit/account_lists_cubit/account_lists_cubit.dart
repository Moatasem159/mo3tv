import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_state.dart';
class AccountListsCubit extends Cubit<AccountListsStates> {
  AccountListsCubit(this._getAccountListsUsecase) : super(AccountListsInitialState()){
    page=0;
    totalPage=0;
    totalResult=0;
    list=[];
  }
  final GetAccountListsUsecase _getAccountListsUsecase;
  static AccountListsCubit get(context)=>BlocProvider.of(context);
  late int page;
  late int totalPage;
  late int totalResult;
  late List list;
  Future<void> getAccountList({required String listType,required String mediaType,int page=1})async{
    emit(GetAccountListsLoadingState());
    Either<Failure, AccountListEntity> accountList =
    await _getAccountListsUsecase.call(MediaParams(listType: listType,mediaType: mediaType,page:page,lang: AppStrings.appLang));
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
