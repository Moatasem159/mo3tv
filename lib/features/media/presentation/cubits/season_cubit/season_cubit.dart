import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/media/presentation/cubits/season_cubit/season_state.dart';
class SeasonCubit extends Cubit<SeasonStates> {
  SeasonCubit(this._getTvShowSeasonDetailsUsecase) : super(SeasonInitialState()){
    appBar= SliverOverlapAbsorberHandle();
  }
  static SeasonCubit get(context) => BlocProvider.of(context);
  final GetTvShowSeasonDetailsUsecase _getTvShowSeasonDetailsUsecase;
  late final SliverOverlapAbsorberHandle appBar;
  Future<void> getTvShowSeasonDetailsData({required int tvShowId, required int seasonNumber}) async {
    emit(GetSeasonDetailsLoadingState());
    Either<Failure, TvShowSeason> response =
        await _getTvShowSeasonDetailsUsecase.call(MediaParams(mediaId: tvShowId, seasonNumber: seasonNumber,lang: AppStrings.appLang));
    emit(response.fold(
        (failure) => GetSeasonDetailsErrorState(),
        (tvShowSeason)=> GetSeasonDetailsSuccessState(tvShowSeason)));
  }
  @override
  Future<void> close() {
    appBar.dispose();
    return super.close();
  }
}