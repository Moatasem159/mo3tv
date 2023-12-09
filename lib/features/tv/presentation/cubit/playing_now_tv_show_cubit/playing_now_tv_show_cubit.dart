import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_state.dart';
class PlayingNowTvShowCubit extends HydratedCubit<PlayingNowTvShowStates> {
  PlayingNowTvShowCubit(this._getNowPlayingTvShowsUsecase) : super(PlayingNowTvShowInitialState());
  static PlayingNowTvShowCubit get(context)=>BlocProvider.of(context);
  final GetTvShowsListUsecase _getNowPlayingTvShowsUsecase;
  Future<void> getNowPlayingTvShowsData() async {
    if(state is! GetNowPlayingTvShowsSuccessState)
    {
      emit(GetNowPlayingTvShowsLoadingState());
      Either<Failure, List<TvShow>> response = await _getNowPlayingTvShowsUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.tv,listType: "on_the_air"));
      emit(response.fold(
              (failure) =>GetNowPlayingTvShowsErrorState(msg: mapFailureToMsg(failure)),
              (playingTvShows) =>GetNowPlayingTvShowsSuccessState(playingTvShows,DateTime.now().toIso8601String(),AppStrings.appLang)));
    }
  }
  @override
  PlayingNowTvShowStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetNowPlayingTvShowsSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(PlayingNowTvShowStates state) {
    if(state is GetNowPlayingTvShowsSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}