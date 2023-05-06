import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
class TrendingMovieCubit extends Cubit<TrendingMovieStates> {
  TrendingMovieCubit(this._getTrendingMoviesUsecase) : super(TrendingMovieInitialState());
  final GetTrendingMoviesUsecase _getTrendingMoviesUsecase;
  Future<void> getTrendingMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetTrendingMoviesLoadingState());
    Either<Failure,List<Movie>> response =
    await _getTrendingMoviesUsecase.call(page: page);
    emit(response.fold(
            (failure) {
          return GetTrendingMoviesErrorState(msg: mapFailureToMsg(failure));
        },(trendingMovies) {
          return GetTrendingMoviesSuccessState(trendingMovies:trendingMovies);
        }));
  }
}
