import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_state.dart';
class PopularTvShowCubit extends Cubit<PopularTvShowStates> {
  PopularTvShowCubit(this._getPopularTvShowsUsecase) : super(PopularTvShowInitialState());
  static PopularTvShowCubit get(context)=>BlocProvider.of(context);
  final GetTvShowsListUsecase _getPopularTvShowsUsecase;
  Future<void> getPopularTvShowsData({required String lang}) async {
    emit(GetPopularTvShowsLoadingState());
    Either<Failure, List<TvShow>> response = await _getPopularTvShowsUsecase.call(listType: "popular",lang: lang);
    emit(response.fold(
        (failure) =>GetPopularTvShowsErrorState(msg: mapFailureToMsg(failure)),
        (popularTvShows) =>GetPopularTvShowsSuccessState(popularTvShows)));
  }
}