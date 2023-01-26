import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_state.dart';

class PlayingNowMovieCubit extends Cubit<PlayingNowMovieStates> {
  PlayingNowMovieCubit({
    required this.getNowPlayingMoviesUsecase,})
      : super(PlayingNowMovieInitialState());

  GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  bool ?nowPlayingError;
  Future<void> getNowPlayingMoviesData({int page=1}) async {
    emit(GetNowPlayingMoviesLoadingState());
    Either<Failure,List<Movie>> response =
    await getNowPlayingMoviesUsecase.call(page);
    emit(response.fold(
            (failure) {
          nowPlayingError=true;
          return GetNowPlayingMoviesErrorState(msg: _mapFailureToMsg(failure));
        },(playingMovies) {
          nowPlayingError=false;
          return GetNowPlayingMoviesSuccessState(nowPlayingMovies:playingMovies);
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
