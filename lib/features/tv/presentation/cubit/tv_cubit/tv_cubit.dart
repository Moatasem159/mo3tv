import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvCubit extends Cubit<TvStates> {
  TvCubit(this._getTvShowDetailsUsecase) : super(TvInitialState());
  static TvCubit get(context)=>BlocProvider.of(context);
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  Future<void> getTvShowDetailsData({required int tvShowId}) async {
    TvShow tvShow;
    emit(GetTvShowDetailsLoadingState());
    Either<Failure,TvShow> response =
    await _getTvShowDetailsUsecase.call(tvId: tvShowId,lang: AppStrings.appLang);
    emit(response.fold((failure)=>GetTvShowDetailsErrorState(msg: mapFailureToMsg(failure)),
            (tvShowData) {
                  tvShow = tvShowData;
              if(tvShow.seasons.first.seasonNumber==0)
              {
                tvShow.seasons.removeAt(0);
              }
              if(tvShow.seasons.last.episodeCount==0||tvShow.seasons.last.airDate.isEmpty)
              {
                tvShow.seasons.removeLast();
                }
              for (var element in tvShow.seasons){
                if(element.posterPath=='')
                  {
                    tvShow.seasons.clear();
                    break;
                  }
              }
              for (var element in tvShow.videos) {
                if(element.name=="Final Trailer")
                {
                  tvShow.trailer =element;
                  break;
                }
                else if(element.name=="Official Trailer")
                {
                   tvShow.trailer =element;
                    break;
                  }
                else if(element.name=="Series Trailer")
                {
                  tvShow.trailer =element;
                  break;
                }
                else if(element.type=="Trailer")
                {
                  tvShow.trailer =element;
                  break;
                }
              }
              tvShow.videos.clear();
          return GetTvShowDetailsSuccessState(tvShow);
        }));
  }
}