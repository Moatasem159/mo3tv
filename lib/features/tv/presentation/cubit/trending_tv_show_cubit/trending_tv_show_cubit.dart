import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_state.dart';
class TrendingTvShowCubit extends HydratedCubit<TrendingTvShowStates> {
  TrendingTvShowCubit(this._getTrendingTvShowsUsecase) : super(TrendingTvShowInitialState());
  static TrendingTvShowCubit get(context)=>BlocProvider.of(context);
  final GetTrendingTvShowsUsecase _getTrendingTvShowsUsecase;
  Future<void> getTrendingTvShowsData() async {
    if(state is! GetTrendingTvShowsSuccessState)
    {
      emit(GetTrendingTvShowsLoadingState());
      Either<Failure, List<TvShow>> response =
      await _getTrendingTvShowsUsecase.call(MediaParams(lang: AppStrings.appLang,mediaType: AppStrings.tv));
      emit(response.fold(
              (failure) =>GetTrendingTvShowsErrorState(msg: mapFailureToMsg(failure)),
              (trendingTvShows) =>GetTrendingTvShowsSuccessState(trendingTvShows,DateTime.now().toIso8601String(),AppStrings.appLang)));
    }
  }
  @override
  TrendingTvShowStates? fromJson(Map<String, dynamic> json) {
    if(json["lang"]==AppStrings.appLang &&DateTime.now().difference(DateTime.parse(json["time"])).inHours<5)
    {
      return GetTrendingTvShowsSuccessState.fromMap(json);
    }
    else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(TrendingTvShowStates state) {
    if(state is GetTrendingTvShowsSuccessState) {
      return state.toMap();
    }
    else {
      return null;
    }
  }
}