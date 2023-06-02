import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowCubit extends Cubit<SimilarTvShowStates> {
  SimilarTvShowCubit(this._getSimilarTvShowsUseCase) : super(SimilarTvShowInitialState());
  static SimilarTvShowCubit get(context) => BlocProvider.of(context);
  final GetSimilarTvShowsUseCase _getSimilarTvShowsUseCase;
  List<TvShow> tvShows = [];
  bool allMovies = false;
  int page = 0;
  Future<void> getSimilarTvShows(
      {required int tvId, required String lang}) async {
    emit(GetSimilarTvShowLoadingState());
    page++;
    Either<Failure, List<TvShow>> response = await _getSimilarTvShowsUseCase.call(tvId: tvId, page: page, lang: lang);
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
}
