import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/usecases/add_tv_show_to_watchlist_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_now_playing_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_popular_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_top_rated_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_recommendations_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_reviews_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_credits_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_gallery_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_as_fav_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/gallery/backdrops/tv_show_backdrops.dart';
import 'package:mo3tv/features/tv/presentation/widgets/gallery/logos/tv_show_logos.dart';
import 'package:mo3tv/features/tv/presentation/widgets/gallery/posters/tv_show_posters.dart';

class TvCubit extends Cubit<TvStates> {
  TvCubit({
    required this.getNowPlayingTvShowsUsecase,
    required this.getPopularTvShowsUsecase,
    required this.getTopRatedTvShowUsecase,
    required this.getTrendingTvShowsUsecase,
    required this.getTvShowDetailsUsecase,
    required this.getTvRecommendationsUseCase,
    required this.getTvShowsReviewsUsecase,
    required this.getTvShowCreditsUsecase,
    required this.getTvShowGalleryUsecase,
    required this.markTvShowAsFavUsecase,
    required this.addTvShowToWatchListUseCase,
    required this.deleteTvShowRateUseCase,
    required this.rateTvShowUseCase,
    required this.getTvShowSeasonDetailsUsecase,

}) : super(TvInitialState());


  GetNowPlayingTvShowsUsecase getNowPlayingTvShowsUsecase;
  GetPopularTvShowsUsecase getPopularTvShowsUsecase;
  GetTopRatedTvShowUsecase getTopRatedTvShowUsecase;
  GetTvShowDetailsUsecase getTvShowDetailsUsecase;
  GetTvRecommendationsUseCase getTvRecommendationsUseCase;
  GetTvShowsReviewsUsecase getTvShowsReviewsUsecase;
  GetTvShowCreditsUsecase getTvShowCreditsUsecase;
  GetTvShowGalleryUsecase getTvShowGalleryUsecase;
  MarkTvShowAsFavUsecase markTvShowAsFavUsecase;
  AddTvShowToWatchListUseCase addTvShowToWatchListUseCase;
  RateTvShowUseCase rateTvShowUseCase;
  DeleteTvShowRateUseCase deleteTvShowRateUseCase;
  GetTrendingTvShowsUsecase getTrendingTvShowsUsecase;
  GetTvShowSeasonDetailsUsecase getTvShowSeasonDetailsUsecase;







  List<TvShow>? nowPlayingTvShows;
  bool? nowPlayingError;
  Future<void> getNowPlayingTvShowsData({int page=1}) async {
    emit(GetNowPlayingTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await getNowPlayingTvShowsUsecase.call(page);
    nowPlayingTvShows = [];
    emit(response.fold(
            (failure) {
              nowPlayingError=true;
              return GetNowPlayingTvShowsErrorState(msg: _mapFailureToMsg(failure));
            },

            (playingTvShows) {
              nowPlayingError=false;
              nowPlayingTvShows = playingTvShows;
          return GetNowPlayingTvShowsSuccessState();
        }));
  }

  List<TvShow>?popularTvShows;
  bool ?popularTvShowError;
  List<TvShow> seeMoreListTvShows=[];
  int tvShowListPage=1;

  Future<void> getPopularTvShowsData(
      {int page = 1, bool seeMore = false}) async {
    emit(GetPopularTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
        await getPopularTvShowsUsecase.call(page);
    emit(response.fold((failure) {
      popularTvShows = [];
      popularTvShowError = true;
      return GetPopularTvShowsErrorState(msg: _mapFailureToMsg(failure));
    }, (popularTvShows) {
      popularTvShowError = false;
      if (seeMore == false) {
        this.popularTvShows = [];
        for (var element in popularTvShows) {
          if (element.posterPath != "" && element.backdropPath != "") {
            if (!this.popularTvShows!.any(
                  (e) => e.id == element.id,
                )) {
              this.popularTvShows!.add(element);
            }
          }
        }
      }
      else if (seeMore == true) {
        for (var element in popularTvShows) {
          if (element.backdropPath != "" && element.posterPath != "") {
            if (!seeMoreListTvShows.any(
              (e) => e.id == element.id,
            )) {
              seeMoreListTvShows.add(element);
            }
          }
        }
      }
      return GetPopularTvShowsSuccessState();
    }));
  }

  List<TvShow> ?topRatedTvShows;
  bool ?topRatedTvShowError;
  Future<void> getTopRatedTvShowsData({int page=1,bool seeMore=false}) async {
    emit(GetTopRatedTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await getTopRatedTvShowUsecase.call(page);
    emit(response.fold(
            (failure) {
              topRatedTvShows=[];
              topRatedTvShowError=true;
              return GetTopRatedTvShowsErrorState(msg: _mapFailureToMsg(failure));

            },
            (topRatedTvShows) {
              topRatedTvShowError=false;
              if (seeMore == false){
                this.topRatedTvShows = [];
              for (var element in topRatedTvShows) {
                if(element.backdropPath != "" && element.posterPath != "")
                {
                  if(!this.topRatedTvShows!.any((e) =>e.id==element.id,))
                  {
                    this.topRatedTvShows!.add(element);
                  }
                }
              }
              }
              else if (seeMore == true) {
                for (var element in topRatedTvShows) {
                  if (element.backdropPath != "" && element.posterPath != "") {
                    if (!seeMoreListTvShows.any(
                          (e) => e.id == element.id,
                    )) {
                      seeMoreListTvShows.add(element);
                    }
                  }
                }
              }
          return GetTopRatedTvShowsSuccessState();
        }));
  }

  List<TvShow>? trendingTvShows;
  bool ?trendingTvShowError;
  Future<void> getTrendingTvShowsData({int page=1,bool seeMore=false}) async {
    emit(GetTrendingTvShowsLoadingState());
    Either<Failure, List<TvShow>> response =
    await getTrendingTvShowsUsecase.call(page);
    emit(response.fold(
            (failure) {
              trendingTvShows=[];
              trendingTvShowError=true;
              return GetTrendingTvShowsErrorState(msg: _mapFailureToMsg(failure));
            },
            (trendingTvShows) {
              trendingTvShowError=false;
              if (seeMore == false){
                this.trendingTvShows=[];
                for (var element in trendingTvShows) {
            if(element.backdropPath != "" && element.posterPath != "")
            {
              if(!this.trendingTvShows!.any((e) =>e.id==element.id,))
              {
                this.trendingTvShows!.add(element);
              }
            }
          }
              }
              else if (seeMore == true) {
                for (var element in trendingTvShows) {
                  if (element.backdropPath != "" && element.posterPath != "") {
                    if (!seeMoreListTvShows.any(
                          (e) => e.id == element.id,
                    )) {
                      seeMoreListTvShows.add(element);
                    }
                  }
                }
              }
          return GetTrendingTvShowsSuccessState();
        }));
  }

  TvShow tvShow= TvShow();
  Future<void> getTvShowDetailsData({required int tvShowId}) async {
    emit(GetTvShowDetailsLoadingState());
    Either<Failure,TvShow> response =
    await getTvShowDetailsUsecase.call(tvShowId);
    emit(response.fold((failure) =>
            GetTvShowDetailsErrorState(msg: _mapFailureToMsg(failure)),
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
    await getTvRecommendationsUseCase.call(tvId: tvId,page: page);
    emit(response.fold(
            (failure) =>
                GetTvShowRecommendationsErrorState(msg: _mapFailureToMsg(failure)),
            (tvRecommendations) {
              if(tvRecommendations.isEmpty){
                allRec=true;
              }
          for (var element in tvRecommendations) {
            if(element.backdropPath!=""|| element.posterPath!="")
            {
              if(!this.tvRecommendations!.any((e) =>e.id==element.id,))
              {
                this.tvRecommendations!.add(element);
              }
            }
          }
          return GetTvShowRecommendationsSuccessState();
        }));
  }


  List<Review>? tvShowsReviews;
  Future<void> getTvShowsReviews({required tvId}) async {
    emit(GetTvShowReviewsLoadingState());
    Either<Failure, List<Review>> response =
    await getTvShowsReviewsUsecase.call(tvId);
    tvShowsReviews = [];
    emit(response.fold(
            (failure) =>
              GetTvShowReviewsErrorState(msg: _mapFailureToMsg(failure)),
            (tvShowsReviews) {
          this.tvShowsReviews = tvShowsReviews;
          return GetTvShowReviewsSuccessState();
        }));
  }

  List<CastMember>? tvShowCredits= [];
  Future<void> getTvShowCredits({required tvId}) async {
    emit(GetTvShowCreditsLoadingState());
    Either<Failure, List<CastMember>> response =
    await getTvShowCreditsUsecase.call(tvId);
    tvShowCredits = [];
    emit(response.fold(
            (failure) =>
                GetTvShowCreditsErrorState(msg: _mapFailureToMsg(failure)),
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


  Gallery? tvShowGallery;
  Future<void> getTvShowGallery({required tvId}) async {
    emit(GetTvShowGalleryLoadingState());
    Either<Failure, Gallery> response =
    await getTvShowGalleryUsecase.call(tvId);
    tvShowGallery=Gallery();
    tvShowGallery!.backdrops=[];
    tvShowGallery!.logos=[];
    tvShowGallery!.posters=[];
    emit(response.fold((failure) =>
                GetTvShowGalleryErrorState(msg: _mapFailureToMsg(failure)),
            (tvShowGallery) {
          for (var element in tvShowGallery.backdrops!){
            if(element.iso6391=="en")
            {
              this.tvShowGallery!.backdrops!.add(element);
            }
          }
          for (var element in tvShowGallery.posters!){
            if(element.iso6391=="en")
            {
              this.tvShowGallery!.posters!.add(element);
            }
          }
          for (var element in tvShowGallery.logos!){
            if(element.iso6391=="en"&&element.filePath!.substring(29,31)!="svg")
            {
              this.tvShowGallery!.logos!.add(element);
            }
          }
          return GetTvShowGallerySuccessState();
        }));
  }


  int index =0;
  List<Widget> tvShowGalleryList=[
    const TvShowBackdrops(),
    const TvShowPosters(),
    const TvShowLogos(),
  ];


  gallery(value){
    emit(ChangeGalleryLoadingState());
    index=value;
    emit(ChangeGallerySuccessState());
  }


  Future<void> favTvShow({required int tvId,required bool fav})async{
    emit(FavTvShowLoadingState());
    Either<Failure, Message> response =
    await markTvShowAsFavUsecase.call(tvId: tvId,fav: fav);
    emit(response.fold((l){
      return FavTvShowErrorState(msg: _mapFailureToMsg(l));
    }, (r){
      return FavTvShowSuccessState(statusCode: r.statusCode!);
    }));
  }

  Future<void> addTvShowToWatchList({required int tvId,required bool watchlist})async{

    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response =
    await addTvShowToWatchListUseCase.call(tvId: tvId,watchlist: watchlist);
    emit(response.fold((l){
      return AddToWatchListErrorState(msg: _mapFailureToMsg(l));
    }, (r){
      return AddToWatchListSuccessState(statusCode: r.statusCode!
      );
    }));
  }


  Future<void> rateTvShow({required dynamic rate,required int tvId})async{
    emit(RateTvShowLoadingState());
    Either<Failure, Message> response =
    await rateTvShowUseCase.call(rate:rate, tvId: tvId);
    emit(response.fold((l){
      return RateTvShowErrorState(msg: _mapFailureToMsg(l));

    }, (r){
      return RateTvShowSuccessState();
    }));
  }
  Future<void> removeTvShowRate({required int tvId})async{

    emit(RemoveRateTvShowLoadingState());
    Either<Failure, Message> response =
    await deleteTvShowRateUseCase.call(tvId);

    emit(response.fold((l){
      return RemoveRateTvShowErrorState(msg: _mapFailureToMsg(l));
    }, (r){
      return RemoveRateTvShowSuccessState();
    }));






  }



  TvShowSeason ?tvShowSeason=const TvShowSeason();
  Future<void> getTvShowSeasonDetailsData({required int tvShowId,required int seasonNumber}) async {
    emit(GetTvShowSeasonDetailsLoadingState());
    Either<Failure,TvShowSeason> response =
    await getTvShowSeasonDetailsUsecase.call(seasonNumber: seasonNumber,tvId: tvShowId);
    tvShowSeason=const TvShowSeason();
    emit(response.fold((failure) =>
        GetTvShowSeasonDetailsErrorState(msg: _mapFailureToMsg(failure)),
            (tvShowSeason) {
          this.tvShowSeason = tvShowSeason;
          return GetTvShowSeasonDetailsSuccessState();
        }));
  }
  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      default:
        return " error";
    }
  }

  List<int> tvIds=[];
  void clearObjects(){
    tvShow= TvShow();
    allRec=false;
    page=1;
    index=0;
    if(tvRecommendations!=null&&tvRecommendations!.isNotEmpty)
    {
      tvRecommendations!.clear();
    }
    // if(movieVideos!=null)
    // {
    //   movieVideos=null;
    // }

    if(tvShowGallery!=null){
      if(tvShowGallery!.backdrops!=null)
      {
        tvShowGallery!.backdrops=null;
      }
      if(tvShowGallery!.posters!=null)
      {
        tvShowGallery!.posters=null;
      }
      if(tvShowGallery!.logos!=null)
      {
        tvShowGallery!.logos=null;
      }
    }
    tvShowCredits!.clear();
    if(tvShowsReviews!=null&&tvShowsReviews!.isNotEmpty){
      tvShowsReviews=null;
    }

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
