import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';
class SimilarMovieCubit extends Cubit<SimilarMovieStates> {
  SimilarMovieCubit(this._getSimilarMovieUseCase) : super(SimilarMovieInitialState()){
    page=0;
    allMovies=false;
    movies=[];
    controller = ScrollController();
    controller.addListener(_scrollListener);
    showScrollButton=false;
  }
  final GetSimilarMovieUseCase _getSimilarMovieUseCase;
  static SimilarMovieCubit get(context) => BlocProvider.of(context);
  late List<Movie> movies;
  late final int movieId;
  late bool allMovies;
  late int page;
  late final ScrollController controller;
  late bool showScrollButton;
  Future<void> getSimilarMovies() async {
    emit(GetSimilarMoviesLoadingState());
    page++;
    Either<Failure, List<Movie>> response = await _getSimilarMovieUseCase.call(MediaParams(mediaId: movieId,page: page,mediaType: AppStrings.movie,lang: AppStrings.appLang));
    emit(response.fold((failure) => GetSimilarMoviesErrorState(msg: mapFailureToMsg(failure)),
        (similarMovies) {
      if (similarMovies.isEmpty) {
        allMovies = true;
        return GetSimilarMoviesSuccessState();
      }
      movies.addAll(similarMovies);
      movies = movies.toSet().toList();
      return GetSimilarMoviesSuccessState();
    }));
  }
  _scrollListener() {
    showScrollButton = controller.offset >= 100.0;
    emit(ListenState());
  }
  scrollingUp(){
    controller.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn);
  }
  @override
  Future<void> close() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    return super.close();
  }
}