import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_state.dart';
class TrendingTvShowCubit extends Cubit<TrendingTvShowStates> {
  TrendingTvShowCubit(this._getTrendingTvShowsUsecase) : super(TrendingTvShowInitialState());
  static TrendingTvShowCubit get(context)=>BlocProvider.of(context);
  final GetTrendingTvShowsUsecase _getTrendingTvShowsUsecase;
  Future<void> getTrendingTvShowsData({required String lang}) async {
    emit(GetTrendingTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await _getTrendingTvShowsUsecase.call(lang: lang);
    emit(response.fold(
        (failure) =>GetTrendingTvShowsErrorState(msg: mapFailureToMsg(failure)),
        (trendingTvShows) =>GetTrendingTvShowsSuccessState(trendingTvShows)));
  }
}