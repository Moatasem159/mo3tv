import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_popular_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_top_rated_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_state.dart';
class MoreTvShowsCubit extends Cubit<MoreTvShowsStates> {
  MoreTvShowsCubit(
   this._getTrendingTvShowsUsecase,
    this._getPopularTvShowsUsecase,
    this._getTopRatedTvShowUsecase
):super(MoreTvShowsInitialState());
  static MoreTvShowsCubit get(context)=>BlocProvider.of(context);
  final GetTrendingTvShowsUsecase _getTrendingTvShowsUsecase;
  final GetPopularTvShowsUsecase _getPopularTvShowsUsecase;
  final GetTopRatedTvShowUsecase _getTopRatedTvShowUsecase;
  List<TvShow> moreTvShows=[];
  int page=1;
  seeMoreTvShows({required int index})async{
    emit(GetMoreTvShowsLoadingState());
    Either<Failure, List<TvShow>>? response;
    page++;
    if(index==1)
    {
      response = await _getTrendingTvShowsUsecase.call(page: page);
    }
    else if(index==2)
    {
      response = await _getPopularTvShowsUsecase.call(page: page);
    }
    else if(index ==3)
    {
      response = await _getTopRatedTvShowUsecase.call(page: page);
    }
    emit(response!.fold(
            (failure) {
          return GetMoreTvShowsErrorState(msg: mapFailureToMsg(failure));
        },
            (moreTvShows) {
              for (var element in moreTvShows) {
                this.moreTvShows.add(element);
              }
          return GetMoreTvShowsSuccessState();
        }));

  }
}