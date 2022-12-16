import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/movies/domain/usecases/add_movie_to_watchlist_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_gallery_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_reviews_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_as_fav_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/backdrops/movie_backdrops.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/logos/movie_logos.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/posters/movie_posters.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit({required this.getNowPlayingMoviesUsecase,
      required this.popularMoviesUsecase,
        required this.getMovieDetailsUseCase,
        required this.getMovieGalleryUsecase,
        required this.getMovieRecommendationsUseCase,
        required this.rateMovieUseCase,
        required this.markMovieAsFavUsecase,
        required this.addMovieToWatchListUseCase,
        required this.deleteRateMovieUseCase,
        required this.getMovieCreditsUsecase,
        required this.getMovieReviewsUsecase,
      required this.getTopRatedMoviesUsecase}) : super(MoviesInitialState());

  GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  GetPopularMoviesUsecase popularMoviesUsecase;
  GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;
  GetMovieReviewsUsecase getMovieReviewsUsecase;
  GetMovieCreditsUsecase getMovieCreditsUsecase;
  GetMovieGalleryUsecase getMovieGalleryUsecase;
  RateMovieUseCase rateMovieUseCase;
  DeleteRateMovieUseCase deleteRateMovieUseCase;
  MarkMovieAsFavUsecase markMovieAsFavUsecase;
  AddMovieToWatchListUseCase addMovieToWatchListUseCase;


  List<Movie>? nowPlayingMovies;
  Future<void> getNowPlayingMoviesData({int page=1}) async {
    emit(GetNowPlayingMoviesLoadingState());
    Either<Failure, List<Movie>> response =
        await getNowPlayingMoviesUsecase.call(page);
    nowPlayingMovies = [];
    emit(response.fold(
        (failure) =>
            GetNowPlayingMoviesErrorState(msg: _mapFailureToMsg(failure)),
        (playingMovies) {
      nowPlayingMovies = playingMovies;
      return GetNowPlayingMoviesSuccessState();
    }));
  }

  List<Movie>? popularMovies;

  Future<void> getPopularMoviesData({int page=1}) async {
    emit(GetNowPlayingMoviesLoadingState());
    Either<Failure, List<Movie>> response =
        await popularMoviesUsecase.call(page);
    popularMovies = [];
    emit(response.fold(
        (failure) =>
            GetNowPlayingMoviesErrorState(msg: _mapFailureToMsg(failure)),
        (popularMovies) {
      this.popularMovies = popularMovies;
      return GetNowPlayingMoviesSuccessState();
    }));
  }

  List<Movie>? topRatedMovies;

  Future<void> getTopRatedMoviesData({int page=1}) async {
    emit(GetTopRatedMoviesLoadingState());
    Either<Failure, List<Movie>> response =
        await getTopRatedMoviesUsecase.call(page);
    topRatedMovies = [];
    emit(response.fold(
        (failure) =>
            GetTopRatedMoviesErrorState(msg: _mapFailureToMsg(failure)),
        (topRatedMovies) {
      this.topRatedMovies = topRatedMovies;
      return GetTopRatedMoviesSuccessState();
    }));
  }

  Movie movie=Movie();
  Future<void> getMovieDetailsData({required int movieId}) async {
    emit(GetMovieDetailsLoadingState());
    Either<Failure,Movie> response =
    await getMovieDetailsUseCase.call(movieId);
    emit(response.fold((failure) =>
            GetMovieDetailsErrorState(msg: _mapFailureToMsg(failure)), (movie) {
          this.movie = movie;
          for (var element in this.movie.videos!) {
            if(element.name=="Official Trailer")
            {
              this.movie.trailer =element;
              break;
            }
            else if(element.name=="Official Teaser")
              {
                this.movie.trailer =element;
                break;
              }
            else if(element.type=="Trailer")
            {
              this.movie.trailer =element;
              break;
            }
          }
          this.movie.videos!.clear();
      return GetMovieDetailsSuccessState();
        }));
  }

  List<Movie>? movieRecommendations=[];
  int page=1;
  bool allRec=false;
  Future<void> getMovieRecommendations({int page=1,required movieId}) async {
    emit(GetMovieRecommendationsLoadingState());
    Either<Failure, List<Movie>> response =
    await getMovieRecommendationsUseCase.call(movieId: movieId,page: page);
    emit(response.fold(
            (failure) =>
            GetMovieRecommendationsErrorState(msg: _mapFailureToMsg(failure)),
            (movieRecommendations) {
              if(movieRecommendations.isEmpty){
                allRec=true;
              }
              for (var element in movieRecommendations) {
                if (element.backdropPath != "" || element.posterPath != "") {
                  if(!this.movieRecommendations!.any((e) =>e.id==element.id,))
                    {
                      this.movieRecommendations!.add(element);
                    }

                }
              }
          return GetMovieRecommendationsSuccessState();
        }));
  }
  List<Review>? movieReviews;
  Future<void> getMovieReviews({required movieId}) async {
    emit(GetMovieReviewsLoadingState());
    Either<Failure, List<Review>> response =
    await getMovieReviewsUsecase.call(movieId);
    movieReviews = [];
    emit(response.fold(
            (failure) =>
                GetMovieReviewsErrorState(msg: _mapFailureToMsg(failure)),
            (movieReviews) {
          this.movieReviews = movieReviews;
          return GetMovieReviewsSuccessState();
        }));
  }

  List<CastMember>? movieCredits= [];
  Future<void> getMovieCredits({required movieId}) async {
    emit(GetMovieCreditsLoadingState());
    Either<Failure, List<CastMember>> response =
    await getMovieCreditsUsecase.call(movieId);
    movieReviews = [];
    emit(response.fold(
            (failure) =>
            GetMovieCreditsErrorState(msg: _mapFailureToMsg(failure)),
            (movieCredits) {
              for (var element in movieCredits) {
                if(element.profilePath!='')
                  {
                    this.movieCredits!.add(element);
                  }
              }
          return GetMovieCreditsSuccessState();
        }));
  }

  Gallery? movieGallery;
  Future<void> getMovieGallery({required movieId}) async {
    emit(GetMovieGalleryLoadingState());
    Either<Failure, Gallery> response =
    await getMovieGalleryUsecase.call(movieId);
    movieGallery=Gallery();
    movieGallery!.backdrops=[];
    movieGallery!.logos=[];
    movieGallery!.posters=[];
    emit(response.fold(
            (failure) =>
            GetMovieGalleryErrorState(msg: _mapFailureToMsg(failure)),
            (movieGallery) {
              for (var element in movieGallery.backdrops!){
                if(element.iso6391=="en")
                  {
                    this.movieGallery!.backdrops!.add(element);
                  }
              }
              for (var element in movieGallery.posters!){
                if(element.iso6391=="en")
                {
                  this.movieGallery!.posters!.add(element);
                }
              }
              for (var element in movieGallery.logos!){
                if(element.iso6391=="en")
                {
                  this.movieGallery!.logos!.add(element);
                }
              }

              // this.movieGallery=movieGallery;
          return GetMovieGallerySuccessState();
        }));
  }


  List<int> moviesId=[];
  void clearObjects(){
    movie=Movie();
    allRec=false;
    page=1;
    // movieKeywords.clear();
    index=0;
   if(movieGallery!=null){
     if(movieGallery!.backdrops!=null)
       {
         movieGallery!.backdrops=null;
       }
     if(movieGallery!.posters!=null)
     {
       movieGallery!.posters=null;
     }
     if(movieGallery!.logos!=null)
     {
       movieGallery!.logos=null;
     }
   }
    if(movieRecommendations!=null&&movieRecommendations!.isNotEmpty)
      {
        movieRecommendations!.clear();
      }
    movieCredits!.clear();
    if(movieReviews!=null&&movieReviews!.isNotEmpty){
      movieReviews=null;
    }

    emit(ClearObjectsState());
  }

  backToBackMovies(){
    if (moviesId.length > 1)
    {
     moviesId.removeAt(moviesId.length-1);

     getMovieDetailsData(movieId: moviesId[moviesId.length-1]);
     // getMovieVideos(movieId: moviesId[moviesId.length-1]);
     getMovieRecommendations(movieId:moviesId[moviesId.length-1]);
    }
    else if(moviesId.length==1)
    {
      // getMovieDetailsData(movieId:moviesId[0]);
      // // getMovieVideos(movieId: moviesId[0]);
      // getMovieRecommendations(movieId:moviesId[0]);

      moviesId.removeAt(0);

    }


  }

  Message ? message;
  Future<void> rateMovie({required dynamic rate,required int movieId})async{
    emit(RateMovieLoadingState());
    Either<Failure, Message> response =
        await rateMovieUseCase.call(rate:rate, movieId: movieId);
    emit(response.fold((l){
      return RateMovieErrorState(msg: _mapFailureToMsg(l));

    }, (r){
      message=r;
     return RateMovieSuccessState();
    }));






  }
  Future<void> removeRateMovie({required int movieId})async{

    emit(RemoveRateMovieLoadingState());
    Either<Failure, Message> response =
    await deleteRateMovieUseCase.call(movieId);

    emit(response.fold((l){
      return RemoveRateMovieErrorState(msg: _mapFailureToMsg(l));
      }, (r){
      message=r;
      return RemoveRateMovieSuccessState();
    }));






  }

  Future<void> favMovie({required int movieId,required bool fav})async{

    emit(FavMovieLoadingState());
    Either<Failure, Message> response =
    await markMovieAsFavUsecase.call(movieId: movieId,fav: fav);
    emit(response.fold((l){
      return FavMovieErrorState(msg: _mapFailureToMsg(l));
    }, (r){
      message=r;
      return FavMovieSuccessState(statusCode: message!.statusCode!);
    }));






  }


  Future<void> addMovieToWatchList({required int movieId,required bool watchlist})async{

    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response =
    await addMovieToWatchListUseCase.call(movieId: movieId,watchlist: watchlist);
    emit(response.fold((l){
      return AddToWatchListErrorState(msg: _mapFailureToMsg(l));
    }, (r){
      message=r;
      return AddToWatchListSuccessState(statusCode: message!.statusCode!
      );
    }));






  }

  int index =0;
  List<Widget> movieGalleryList=[
    const MovieBackdrops(),
    const MoviePosters(),
    const MovieLogos(),
  ];

  gallery(value,id){
    emit(ChangeGalleryLoadingState());
    index=value;
    emit(ChangeGallerySuccessState());
  }
  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      default:
        return " error";
    }
  }
}
