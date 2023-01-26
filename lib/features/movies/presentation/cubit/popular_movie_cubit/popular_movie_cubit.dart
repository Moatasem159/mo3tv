import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieStates> {
  PopularMovieCubit({required this.popularMoviesUsecase,}) : super(PopularMovieInitialState());

  GetPopularMoviesUsecase popularMoviesUsecase;
  List<Movie>popularMovies = [];
  Future<void> getPopularMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetPopularMoviesLoadingState());
    Either<Failure, List<Movie>> response =
    await popularMoviesUsecase.call(page);

    emit(response.fold((failure) {
      return GetPopularMoviesErrorState(msg: _mapFailureToMsg(failure));
    }, (popularMovies) {
      for (var element in popularMovies) {
        if (element.backdropPath != "" && element.posterPath != "") {
          this.popularMovies.add(element);
        }
      }
      return GetPopularMoviesSuccessState();
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
