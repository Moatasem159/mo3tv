import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvCubit extends Cubit<TvStates> {
  TvCubit(this._getTvShowDetailsUsecase) : super(TvInitialState());
  static TvCubit get(context)=>BlocProvider.of(context);
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  TvShow tvShow= TvShow();
  Future<void> getTvShowDetailsData({required int tvShowId}) async {
    emit(GetTvShowDetailsLoadingState());
    Either<Failure,TvShow> response =
    await _getTvShowDetailsUsecase.call(tvId: tvShowId);
    emit(response.fold((failure) =>
            GetTvShowDetailsErrorState(msg: mapFailureToMsg(failure)),
            (tvShow) {
              this.tvShow = tvShow;
              if(this.tvShow.seasons!.first.seasonNumber==0)
              {
                this.tvShow.seasons!.removeAt(0);
              }
              if(this.tvShow.seasons!.last.episodeCount==0||this.tvShow.seasons!.last.airDate==null)
              {
                  this.tvShow.seasons!.removeLast();
                }
              for (var element in this.tvShow.seasons!){
                if(element.posterPath=='')
                  {
                    this.tvShow.seasons!.clear();
                    break;
                  }
              }
              for (var element in this.tvShow.videos!) {
                if(element.name=="Final Trailer")
                {
                  this.tvShow.trailer =element;
                  break;
                }
                else if(element.name=="Official Trailer")
                {
                    this.tvShow.trailer =element;
                    break;
                  }
                else if(element.name=="Series Trailer")
                {
                  this.tvShow.trailer =element;
                  break;
                }
                else if(element.type=="Trailer")
                {
                  this.tvShow.trailer =element;
                  break;
                }
              }
              this.tvShow.videos!.clear();
          return GetTvShowDetailsSuccessState();
        }));
  }

}