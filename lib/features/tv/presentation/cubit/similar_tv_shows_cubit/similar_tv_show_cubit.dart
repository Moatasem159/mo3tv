import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowCubit extends Cubit<SimilarTvShowStates> {
  SimilarTvShowCubit(this._getSimilarTvShowsUseCase) : super(SimilarTvShowInitialState());
  static SimilarTvShowCubit get(context)=>BlocProvider.of(context);
  final GetSimilarTvShowsUseCase _getSimilarTvShowsUseCase;
  List<TvShow> tvShows=[];
  bool allMovies=false;
  int page=0;
  Future<void> getSimilarTvShows({required int tvId}) async {
    emit(GetSimilarTvShowLoadingState());
    page++;
    Either<Failure, List<TvShow>> response = await _getSimilarTvShowsUseCase.call(tvId: tvId,page: page);
    emit(response.fold((failure) => GetSimilarTvShowErrorState(msg: mapFailureToMsg(failure)),
            (similarMovies) {
          if(similarMovies.isEmpty)
          {
            allMovies=true;
            return GetSimilarTvShowSuccessState();
          }
          for (var element in similarMovies) {
            if(element.posterPath!=''&&element.backdropPath!="")
            {
              if(!tvShows.contains(element))
              {
                tvShows.add(element);
              }
            }
          }
          return GetSimilarTvShowSuccessState();
        }));
  }

}
