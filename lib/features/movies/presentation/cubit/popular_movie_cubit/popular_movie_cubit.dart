import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
class PopularMovieCubit extends Cubit<PopularMovieStates> {
  PopularMovieCubit(this._popularMoviesUsecase) : super(PopularMovieInitialState());
  final GetMoviesListUsecase _popularMoviesUsecase;
  Future<void> getPopularMoviesData({required String lang}) async {
    emit(GetPopularMoviesLoadingState());
    Either<Failure, List<Movie>> response=await _popularMoviesUsecase.call(listType: "popular",lang: lang);
    emit(response.fold(
        (failure)=>GetPopularMoviesErrorState(msg: mapFailureToMsg(failure)),
        (popularMovies)=>GetPopularMoviesSuccessState(popularMovies)));
  }
}