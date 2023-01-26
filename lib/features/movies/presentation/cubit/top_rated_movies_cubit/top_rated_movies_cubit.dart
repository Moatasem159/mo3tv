import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesStates> {
  TopRatedMoviesCubit({ required this.getTopRatedMoviesUsecase}) : super(TopRatedMoviesInitialState());

  GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  List<Movie> topRatedMovies=[];
  Future<void> getTopRatedMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetTopRatedMoviesLoadingState());
    Either<Failure, List<Movie>> response =
    await getTopRatedMoviesUsecase.call(page);
    emit(response.fold(
            (failure) {
          return GetTopRatedMoviesErrorState(msg: _mapFailureToMsg(failure));
        },
            (topRatedMovies) {
              for (var element in topRatedMovies) {
                if (element.backdropPath != "" && element.posterPath != "") {
                  this.topRatedMovies.add(element);
                }
              }
          return GetTopRatedMoviesSuccessState();
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
