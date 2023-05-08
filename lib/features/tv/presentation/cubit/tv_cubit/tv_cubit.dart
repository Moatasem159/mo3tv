import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/usecases/add_tv_show_to_watchlist_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_recommendations_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_credits_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_as_fav_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvCubit extends Cubit<TvStates> {
  TvCubit(
     this._getTvShowDetailsUsecase,
     this._getTvRecommendationsUseCase,
     this._getTvShowCreditsUsecase,
     this._markTvShowAsFavUsecase,
     this._addTvShowToWatchListUseCase,
     this._deleteTvShowRateUseCase,
     this._rateTvShowUseCase,
     this._getTvShowSeasonDetailsUsecase,
      ) : super(TvInitialState());
  static TvCubit get(context)=>BlocProvider.of(context);
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  final GetTvRecommendationsUseCase _getTvRecommendationsUseCase;
  final GetTvShowCreditsUsecase _getTvShowCreditsUsecase;
  final MarkTvShowAsFavUsecase _markTvShowAsFavUsecase;
  final AddTvShowToWatchListUseCase _addTvShowToWatchListUseCase;
  final RateTvShowUseCase _rateTvShowUseCase;
  final DeleteTvShowRateUseCase _deleteTvShowRateUseCase;
  final GetTvShowSeasonDetailsUsecase _getTvShowSeasonDetailsUsecase;
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
  List<TvShow>? tvRecommendations=[];
  int page=1;
  bool allRec=false;
  Future<void> getTvShowsRecommendations({int page=1,required tvId})async{
    emit(GetTvShowRecommendationsLoadingState());
    Either<Failure, List<TvShow>> response =
    await _getTvRecommendationsUseCase.call(tvId: tvId,page: page);
    emit(response.fold(
            (failure) =>
                GetTvShowRecommendationsErrorState(msg: mapFailureToMsg(failure)),
            (tvRecommendations) {
              if(tvRecommendations.isEmpty){
                allRec=true;
              }
          for (var element in tvRecommendations) {
            if(!this.tvRecommendations!.any((e) =>e.id==element.id,))
            {
              this.tvRecommendations!.add(element);
            }
          }
          return GetTvShowRecommendationsSuccessState();
        }));
  }
  List<CastMember>? tvShowCredits= [];
  Future<void> getTvShowCredits({required tvId}) async {
    emit(GetTvShowCreditsLoadingState());
    Either<Failure, List<CastMember>> response =
    await _getTvShowCreditsUsecase.call(tvId: tvId);
    tvShowCredits = [];
    emit(response.fold(
            (failure) =>
                GetTvShowCreditsErrorState(msg: mapFailureToMsg(failure)),
            (tvShowCredits) {
          for (var element in tvShowCredits) {
            if(element.profilePath!='')
            {
              this.tvShowCredits!.add(element);
            }
          }
          return GetTvShowCreditsSuccessState();
        }));
  }
  Future<void> favTvShow({required int tvId,required bool fav})async{
    emit(FavTvShowLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(tvId: tvId,fav: fav);
    emit(response.fold((l){
      return FavTvShowErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return FavTvShowSuccessState(statusCode: r.statusCode!);
    }));
  }
  Future<void> addTvShowToWatchList({required int tvId,required bool watchlist})async{
    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response =
    await _addTvShowToWatchListUseCase.call(tvId: tvId,watchlist: watchlist);
    emit(response.fold((l){
      return AddToWatchListErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return AddToWatchListSuccessState(statusCode: r.statusCode!
      );
    }));
  }
  Future<void> rateTvShow({required dynamic rate,required int tvId})async{
    emit(RateTvShowLoadingState());
    Either<Failure, Message> response =
    await _rateTvShowUseCase.call(rate:rate, tvId: tvId);
    emit(response.fold((l){
      return RateTvShowErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return RateTvShowSuccessState();
    }));
  }
  Future<void> removeTvShowRate({required int tvId})async{
    emit(RemoveRateTvShowLoadingState());
    Either<Failure, Message> response =
    await _deleteTvShowRateUseCase.call(tvId: tvId);
    emit(response.fold((l){
      return RemoveRateTvShowErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return RemoveRateTvShowSuccessState();
    }));
  }
  TvShowSeason ?tvShowSeason=const TvShowSeason();
  Future<void> getTvShowSeasonDetailsData({required int tvShowId,required int seasonNumber}) async {
    emit(GetTvShowSeasonDetailsLoadingState());
    Either<Failure,TvShowSeason> response =
    await _getTvShowSeasonDetailsUsecase.call(seasonNumber: seasonNumber,tvId: tvShowId);
    tvShowSeason=const TvShowSeason();
    emit(response.fold((failure) =>
        GetTvShowSeasonDetailsErrorState(msg:mapFailureToMsg(failure)),
            (tvShowSeason) {
          this.tvShowSeason = tvShowSeason;
          return GetTvShowSeasonDetailsSuccessState();
        }));
  }
  List<int> tvIds=[];
  void clearObjects(){
    tvShow= TvShow();
    allRec=false;
    page=1;
    // index=0;
    if(tvRecommendations!=null&&tvRecommendations!.isNotEmpty)
    {
      tvRecommendations!.clear();
    }
    tvShowCredits!.clear();
    emit(ClearObjectsState());
  }
  backToBackTvShows(){
    if (tvIds.length > 1)
    {
      tvIds.removeAt(tvIds.length-1);

      getTvShowDetailsData(tvShowId:tvIds[tvIds.length-1]);
      // getMovieVideos(movieId: moviesId[moviesId.length-1]);
      getTvShowsRecommendations(tvId:tvIds[tvIds.length-1]);
    }
    else if(tvIds.length==1)
    {
      // getMovieDetailsData(movieId:moviesId[0]);
      // // getMovieVideos(movieId: moviesId[0]);
      // getMovieRecommendations(movieId:moviesId[0]);
      tvIds.removeAt(0);
    }


  }
}