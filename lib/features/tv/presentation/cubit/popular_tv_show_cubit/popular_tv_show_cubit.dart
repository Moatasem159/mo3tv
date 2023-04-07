import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_popular_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_state.dart';
class PopularTvShowCubit extends Cubit<PopularTvShowStates> {
  PopularTvShowCubit({required this.getPopularTvShowsUsecase,}) : super(PopularTvShowInitialState());
  static PopularTvShowCubit get(context)=>BlocProvider.of(context);
  GetPopularTvShowsUsecase getPopularTvShowsUsecase;
  Future<void> getPopularTvShowsData({int page = 1, bool seeMore = false}) async {
    emit(GetPopularTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await getPopularTvShowsUsecase.call(page);
    emit(response.fold((failure) {
      return GetPopularTvShowsErrorState(msg: mapFailureToMsg(failure));
    }, (popularTvShows) {
      return GetPopularTvShowsSuccessState(popularTvShows);
    }));
  }
}
