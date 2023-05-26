import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
class TopRatedMoviesCubit extends Cubit<TopRatedMoviesStates> {
  TopRatedMoviesCubit(this._getTopRatedMoviesUsecase) : super(TopRatedMoviesInitialState());
  final GetMoviesListUsecase _getTopRatedMoviesUsecase;
  Future<void> getTopRatedMoviesData() async {
    emit(GetTopRatedMoviesLoadingState());
    Either<Failure, List<Movie>> response = await _getTopRatedMoviesUsecase.call(listType: "top_rated");
    emit(response.fold(
      (failure) => GetTopRatedMoviesErrorState(msg: mapFailureToMsg(failure)),
      (topRatedMovies) => GetTopRatedMoviesSuccessState(topRatedMovies)));
  }
}