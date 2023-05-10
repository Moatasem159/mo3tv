import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_state.dart';
class PlayingNowMovieCubit extends Cubit<PlayingNowMovieStates> {
  PlayingNowMovieCubit(
     this._getNowPlayingMoviesUsecase)
      : super(PlayingNowMovieInitialState());

  final GetNowPlayingMoviesUsecase _getNowPlayingMoviesUsecase;
  static PlayingNowMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getNowPlayingMoviesData({int page=1}) async {
    emit(GetNowPlayingMoviesLoadingState());
    Either<Failure,List<Movie>> response =
    await _getNowPlayingMoviesUsecase.call(page: page);
    emit(response.fold(
            (failure) {
          return GetNowPlayingMoviesErrorState(msg: mapFailureToMsg(failure));
        },(playingMovies) {
          return GetNowPlayingMoviesSuccessState(nowPlayingMovies:playingMovies);
        }));
  }
}
