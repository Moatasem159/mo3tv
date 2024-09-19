import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'search_events.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  SearchBloc(this._searchUsecase) : super(SearchInitialState()) {
    on<SearchEvent>(
      (event, emit) => search(emit, word: event.query, lang: event.lang),
      transformer: (eventsStream, mapper) => eventsStream
          .debounceTime(const Duration(milliseconds: 300))
          .distinct()
          .switchMap(mapper),
    );
    on<ClearEvent>((event, emit) => clear(emit));
  }

  static SearchBloc get(context) => BlocProvider.of(context);
  final SearchUsecase _searchUsecase;
  TextEditingController controller = TextEditingController();

  search(emit,
      {int page = 1, required String word, required String lang}) async {
    if (controller.text.isNotEmpty) {
      emit(SearchLoadingState());
      List<Search> items = [];
      ApiResult<List<Search>> response =
          await _searchUsecase(page: page, word: word, lang: lang);

      switch (response) {
        case ApiSuccess<List<Search>>():
          items = [];
          for (var element in response.data) {
            if (element.backdropPath != "" && element.posterPath != "") {
              items.add(element);
            }
          }
          if (items.isEmpty) {
            emit(SearchSuccessEmptyState());
          } else {
            emit(SearchSuccessState(items));
          }
        case ApiFailure<List<Search>>():
          emit(SearchErrorState());
      }
    } else {
      emit(SearchInitialState());
    }
  }

  clear(emit) {
    controller.clear();
    emit(SearchInitialState());
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}