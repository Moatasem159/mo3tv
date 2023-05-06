import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_state.dart';
class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this._searchUsecase):super(SearchInitialStates());
  final SearchUsecase _searchUsecase;
  TextEditingController controller=TextEditingController();
  List<Search> items=[];
  Future<void> search({int page=1,required String word})async {
    emit(SearchLoadingState());
    Either<Failure,List<Search>> response =
    await _searchUsecase.call(page: page,word: word);
    emit(response.fold((l){
      return SearchErrorState();
      }, (searchItems){
      items=[];
      for (var element in searchItems) {
          if(element.backdropPath != "" && element.posterPath != "")
          {
            items.add(element);
          }
      }
      return SearchSuccessState();
    }));
  }
  clear(){
    emit(SearchClearLoadingState());
    controller.clear();
    items.clear();
    emit(SearchClearSuccessState());
  }
  clearList(){
    emit(SearchClearLoadingState());
    items.clear();
    emit(SearchClearSuccessState());
  }
}
