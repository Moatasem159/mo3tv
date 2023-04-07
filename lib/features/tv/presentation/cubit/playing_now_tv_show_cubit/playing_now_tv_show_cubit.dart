import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_now_playing_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_state.dart';
class PlayingNowTvShowCubit extends Cubit<PlayingNowTvShowStates> {
  PlayingNowTvShowCubit({required this.getNowPlayingTvShowsUsecase}) : super(PlayingNowTvShowInitialState());
  static PlayingNowTvShowCubit get(context)=>BlocProvider.of(context);
  GetNowPlayingTvShowsUsecase getNowPlayingTvShowsUsecase;
  Future<void> getNowPlayingTvShowsData({int page=1}) async {
    emit(GetNowPlayingTvShowsLoadingState());
    Either<Failure, List<TvShow>> response = await getNowPlayingTvShowsUsecase.call(page);
    emit(response.fold(
            (failure) {
          return GetNowPlayingTvShowsErrorState(msg: mapFailureToMsg(failure));
        },(playingTvShows) {
          return GetNowPlayingTvShowsSuccessState(playingTvShows);
        }));
  }
}
