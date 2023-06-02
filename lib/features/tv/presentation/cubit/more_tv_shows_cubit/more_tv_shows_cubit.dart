import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_state.dart';
class MoreTvShowsCubit extends Cubit<MoreTvShowsStates> {
  MoreTvShowsCubit(this._getTvShowsListUsecase, this._getTrendingTvShowsUsecase) : super(MoreTvShowsInitialState());
  static MoreTvShowsCubit get(context) => BlocProvider.of(context);
  final GetTrendingTvShowsUsecase _getTrendingTvShowsUsecase;
  final GetTvShowsListUsecase _getTvShowsListUsecase;
  List<TvShow> moreTvShows = [];
  int page = 1;
  seeMoreTvShows({required int index, required String lang}) async {
    emit(GetMoreTvShowsLoadingState());
    Either<Failure, List<TvShow>>? response;
    page++;
    if (index == 1) {
      response = await _getTrendingTvShowsUsecase.call(page: page, lang: lang);
    } else if (index == 2) {
      response = await _getTvShowsListUsecase.call(page: page, listType: "popular", lang: lang);
    } else if (index == 3) {
      response = await _getTvShowsListUsecase.call(page: page, listType: "top_rated", lang: lang);
    }
    emit(response!.fold((failure) => GetMoreTvShowsErrorState(),(moreTvShows) {
      this.moreTvShows.addAll(moreTvShows);
      this.moreTvShows = this.moreTvShows.toSet().toList();
      return GetMoreTvShowsSuccessState();
    }));
  }
}