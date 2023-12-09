import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowCubit extends Cubit<SimilarTvShowStates> {
  SimilarTvShowCubit(this._getSimilarTvShowsUseCase) : super(SimilarTvShowInitialState()){
    page=0;
    allMovies=false;
    tvShows=[];
    controller=ScrollController();
    showScrollButton=false;
    controller.addListener(_scrollListener);
  }
  static SimilarTvShowCubit get(context) => BlocProvider.of(context);
  final GetSimilarTvShowsUseCase _getSimilarTvShowsUseCase;
  late List<TvShow> tvShows;
  late final int tvId;
  late bool allMovies;
  late int page;
  late bool showScrollButton;
  late final ScrollController controller;
   _scrollListener() {
      showScrollButton = controller.offset >= 100.0;
      emit(ListenState());
  }
  scrollingUp(){
    controller.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn);
  }
  Future<void> getSimilarTvShows() async {
    emit(GetSimilarTvShowLoadingState());
    page++;

    Either<Failure, List<TvShow>> response = await _getSimilarTvShowsUseCase.call(MediaParams(mediaId: tvId,page: page,mediaType: AppStrings.tv,lang: AppStrings.appLang));
    emit(response.fold((failure) => GetSimilarTvShowErrorState(),
        (similarTvShows) {
      if (similarTvShows.isEmpty) {
        allMovies = true;
        return GetSimilarTvShowSuccessState();
      }
      tvShows.addAll(similarTvShows);
      tvShows = tvShows.toSet().toList();
      return GetSimilarTvShowSuccessState();
    }));
  }
  @override
  Future<void> close() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    return super.close();
  }
}
