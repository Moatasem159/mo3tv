import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_state.dart';
class SeasonCubit extends Cubit<SeasonStates> {
  SeasonCubit(this._getTvShowSeasonDetailsUsecase) : super(SeasonInitialState());
  static SeasonCubit get(context) => BlocProvider.of(context);
  final GetTvShowSeasonDetailsUsecase _getTvShowSeasonDetailsUsecase;
  Future<void> getTvShowSeasonDetailsData(
      {required int tvShowId, required int seasonNumber}) async {
    emit(GetSeasonDetailsLoadingState());
    Either<Failure, TvShowSeason> response =
        await _getTvShowSeasonDetailsUsecase.call(seasonNumber: seasonNumber, tvId: tvShowId);
    emit(response.fold(
        (failure) => GetSeasonDetailsErrorState(msg: mapFailureToMsg(failure)),
        (tvShowSeason) {
          return GetSeasonDetailsSuccessState(tvShowSeason);
        },
      ),
    );
  }
}