import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_state.dart';
class PlayingNowMovieCubit extends HydratedCubit<PlayingNowMovieStates> {
  PlayingNowMovieCubit(this._getNowPlayingMoviesUsecase) : super(PlayingNowMovieInitialState());
  final GetMoviesListUsecase _getNowPlayingMoviesUsecase;
  static PlayingNowMovieCubit get(context)=>BlocProvider.of(context);
  Future<void> getNowPlayingMoviesData() async {
   if(state is!GetNowPlayingMoviesSuccessState)
     {
       emit(GetNowPlayingMoviesLoadingState());
       Either<Failure,List<Movie>> response =await _getNowPlayingMoviesUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.movie,listType: "now_playing"));
       emit(response.fold(
               (failure)=>GetNowPlayingMoviesErrorState(msg: mapFailureToMsg(failure)),
               (playingMovies)=>GetNowPlayingMoviesSuccessState(playingMovies,DateTime.now().toIso8601String(),AppStrings.appLang)));
     }
  }
  @override
  PlayingNowMovieStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetNowPlayingMoviesSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(PlayingNowMovieStates state) {
    if(state is GetNowPlayingMoviesSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}