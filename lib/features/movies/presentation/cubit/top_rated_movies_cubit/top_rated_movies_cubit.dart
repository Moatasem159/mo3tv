import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
class TopRatedMoviesCubit extends Cubit<TopRatedMoviesStates> {
  TopRatedMoviesCubit({ required this.getTopRatedMoviesUsecase}) : super(TopRatedMoviesInitialState());
  GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  Future<void> getTopRatedMoviesData({int page=1,bool seeMore=false}) async {
    emit(GetTopRatedMoviesLoadingState());
    Either<Failure, List<Movie>> response =
    await getTopRatedMoviesUsecase.call(page);
    emit(response.fold(
            (failure) {
          return GetTopRatedMoviesErrorState(msg: mapFailureToMsg(failure));
        },(topRatedMovies) {
          return GetTopRatedMoviesSuccessState(topRatedMovies);
        }));
  }
}