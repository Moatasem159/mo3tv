import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_state.dart';
class TrendingTvShowCubit extends Cubit<TrendingTvShowStates> {
  TrendingTvShowCubit({
    required this.getTrendingTvShowsUsecase,
  }) : super(TrendingTvShowInitialState());
  static TrendingTvShowCubit get(context)=>BlocProvider.of(context);
  GetTrendingTvShowsUsecase getTrendingTvShowsUsecase;
  Future<void> getTrendingTvShowsData({int page=1,bool seeMore=false}) async {
    emit(GetTrendingTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await getTrendingTvShowsUsecase.call(page);
    emit(response.fold(
            (failure) {
          return GetTrendingTvShowsErrorState(msg: mapFailureToMsg(failure));
        },(trendingTvShows) {
          return GetTrendingTvShowsSuccessState(trendingTvShows);
        }));
  }

}
