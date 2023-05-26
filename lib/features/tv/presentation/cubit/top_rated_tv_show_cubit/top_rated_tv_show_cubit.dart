import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_state.dart';
class TopRatedTvShowsCubit extends Cubit<TopRatedTvShowsStates> {
  TopRatedTvShowsCubit(this._getTopRatedTvShowUsecase) : super(TopRatedTvShowInitialState());
  static TopRatedTvShowsCubit get(context)=>BlocProvider.of(context);
  final GetTvShowsListUsecase _getTopRatedTvShowUsecase;
  Future<void> getTopRatedTvShowsData() async {
    emit(GetTopRatedTvShowsLoadingState());
    Either<Failure, List<TvShow>> response = await _getTopRatedTvShowUsecase.call(listType: "top_rated");
    emit(response.fold(
            (failure) =>GetTopRatedTvShowsErrorState(msg: mapFailureToMsg(failure)),
            (topRatedTvShows) =>GetTopRatedTvShowsSuccessState(topRatedTvShows)));
  }
}