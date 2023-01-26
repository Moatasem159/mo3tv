import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieStates> {
  TrendingMovieCubit({required this.getTrendingMoviesUsecase}) : super(TrendingMovieInitialState());

  GetTrendingMoviesUsecase getTrendingMoviesUsecase;
  Future<void> getTrendingMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetTrendingMoviesLoadingState());
    Either<Failure, List<Movie>> response =
    await getTrendingMoviesUsecase.call(page);
    emit(response.fold(
            (failure) {
          return GetTrendingMoviesErrorState(msg: _mapFailureToMsg(failure));
        },
            (trendingMovies) {
              List<Movie>movies=[];
              for (var element in trendingMovies) {
                if(element.backdropPath != "" && element.posterPath != "")
                {
                  movies.add(element);
                }
              }
          return GetTrendingMoviesSuccessState(trendingMovies:movies);
        }));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      default:
        return " error";
    }
  }
}
