import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_one_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/get_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/save_search_usecase.dart';

part 'search_list_state.dart';

class SearchListCubit extends Cubit<SearchListStates> {
  SearchListCubit(this._saveSearchUsecase, this._getSearchListUsecase,
      this._clearSearchListUsecase, this._clearOneSearchListUsecase)
      : super(SearchListInitialState());
  final SaveSearchUsecase _saveSearchUsecase;
  final GetSearchListUsecase _getSearchListUsecase;
  final ClearSearchListUsecase _clearSearchListUsecase;
  final ClearOneSearchUsecase _clearOneSearchListUsecase;

  static SearchListCubit get(context) => BlocProvider.of(context);

  Future<void> saveSearch({required Search search}) async {
    emit(SaveSearchLoadingState());
    ApiResult<bool> response = await _saveSearchUsecase(search: search);
    switch (response) {
      case ApiSuccess<bool>():
        emit(SaveSearchSuccessState());
      case ApiFailure<bool>():
        emit(SaveSearchErrorState());
    }
  }

  List<Search> recently = [];

  Future<void> getSearchList() async {
    emit(GetSearchListLoadingState());
    ApiResult<List<Search>> response = await _getSearchListUsecase();
    switch (response) {
      case ApiSuccess<List<Search>>():
        recently = response.data;
        emit(GetSearchListSuccessState());
      case ApiFailure<List<Search>>():
        emit(GetSearchListErrorState());
    }
  }

  Future<void> clearSearch() async {
    emit(ClearSearchLoadingState());
    ApiResult<bool> response = await _clearSearchListUsecase();
    switch (response) {
      case ApiSuccess<bool>():
        recently.clear();
        emit(ClearSearchSuccessState());
      case ApiFailure<bool>():
        emit(ClearSearchErrorState());
    }
  }

  Future<void> clearOneSearch({required Search search}) async {
    emit(ClearSearchLoadingState());
    ApiResult<bool> response = await _clearOneSearchListUsecase(search: search);
    switch (response) {
      case ApiSuccess<bool>():
        recently.remove(search);
        emit(ClearSearchSuccessState());
      case ApiFailure<bool>():
        emit(ClearSearchErrorState());
    }
  }
}