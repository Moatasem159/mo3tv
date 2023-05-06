import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
class PopularMovieCubit extends Cubit<PopularMovieStates> {
  PopularMovieCubit(this._popularMoviesUsecase) : super(PopularMovieInitialState());
  final GetPopularMoviesUsecase _popularMoviesUsecase;
  Future<void> getPopularMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetPopularMoviesLoadingState());
    Either<Failure, List<Movie>> response =
    await _popularMoviesUsecase.call(page: page);
    emit(response.fold((failure) {
      return GetPopularMoviesErrorState(msg: mapFailureToMsg(failure));
    }, (popularMovies) {
      return GetPopularMoviesSuccessState(popularMovies);
    }));
  }
}
