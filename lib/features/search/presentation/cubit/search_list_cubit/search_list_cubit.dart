import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_one_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/get_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/save_search_usecase.dart';
part 'search_list_state.dart';
class SearchListCubit extends Cubit<SearchListStates> {
  SearchListCubit(this._saveSearchUsecase, this._getSearchListUsecase,
      this._clearSearchListUsecase,this._clearOneSearchListUsecase)
      : super(SearchListInitialState());
  final SaveSearchUsecase _saveSearchUsecase;
  final GetSearchListUsecase _getSearchListUsecase;
  final ClearSearchListUsecase _clearSearchListUsecase;
  final ClearOneSearchUsecase _clearOneSearchListUsecase;
  static SearchListCubit get(context)=>BlocProvider.of(context);
  Future<void> saveSearch({required Search search})async{
    emit(SaveSearchLoadingState());
    Either<Failure,bool> response = await _saveSearchUsecase(search: search);
    emit(response.fold((l)=>SaveSearchErrorState(), (r)=>SaveSearchSuccessState()));
  }
  List<Search> recently=[];
  Future<void> getSearchList() async {
    emit(GetSearchListLoadingState());
    Either<Failure, List<Search>> response = await _getSearchListUsecase();
    emit(response.fold((l) => GetSearchListErrorState(),(r) {
      recently = r;
      return GetSearchListSuccessState();
    }));
  }
  Future<void> clearSearch()async{
    emit(ClearSearchLoadingState());
    Either<Failure,bool> response = await _clearSearchListUsecase();
    emit(response.fold((l)=>ClearSearchErrorState(), (r){
      recently.clear();
      return ClearSearchSuccessState();
    }));
  }
  Future<void> clearOneSearch({required Search search})async{
    emit(ClearSearchLoadingState());
    Either<Failure,bool> response = await _clearOneSearchListUsecase(search: search);
    emit(response.fold((l)=>ClearSearchErrorState(), (r){
      recently.remove(search);
      return ClearSearchSuccessState();
    }));
  }
}
