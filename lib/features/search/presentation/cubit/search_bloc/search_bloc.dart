import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_events.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_state.dart';
import 'package:rxdart/rxdart.dart';
class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  SearchBloc(this._searchUsecase) : super(SearchInitialState()) {
    on<SearchEvent>(
      (event, emit) => search(emit,word: event.query,lang:event.lang),
      transformer: (eventsStream, mapper) => eventsStream
          .debounceTime(const Duration(milliseconds: 300))
          .distinct()
          .switchMap(mapper),
    );
    on<ClearEvent>((event, emit) => clear(emit));
  }
  static SearchBloc get(context)=>BlocProvider.of(context);
  final SearchUsecase _searchUsecase;
  TextEditingController controller=TextEditingController();
 search(emit,{int page=1,required String word,required String lang})async{
   if(controller.text.isNotEmpty)
   {
     emit(SearchLoadingState());
     List<Search> items=[];
     Either<Failure,List<Search>> response =
     await _searchUsecase.call(page: page,word: word,lang: lang);
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
       if(items.isEmpty)
       {
         return SearchSuccessEmptyState();
       }
       else{
         return SearchSuccessState(items);
       }
     }));
   }
   else{
     emit(SearchInitialState());
   }
  }
  clear(emit){
    controller.clear();
    emit(SearchInitialState());
  }
}
