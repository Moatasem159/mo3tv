import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/movies/domain/usecases/add_movie_to_watchlist_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_reviews_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_as_fav_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class MovieCubit extends Cubit<MovieStates> {
  MovieCubit(
        this._getMovieDetailsUseCase,
        this._getMovieRecommendationsUseCase,
        this._rateMovieUseCase,
        this._markMovieAsFavUsecase,
        this._addMovieToWatchListUseCase,
        this._deleteRateMovieUseCase,
        this._getMovieCreditsUsecase,
        this._getMovieReviewsUsecase
      ) : super(MoviesInitialState());
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase _getMovieRecommendationsUseCase;
  final GetMovieReviewsUsecase _getMovieReviewsUsecase;
  final GetMovieCreditsUsecase _getMovieCreditsUsecase;
  final RateMovieUseCase _rateMovieUseCase;
  final DeleteRateMovieUseCase _deleteRateMovieUseCase;
  final MarkMovieAsFavUsecase _markMovieAsFavUsecase;
  final AddMovieToWatchListUseCase _addMovieToWatchListUseCase;
  Movie movie=Movie();
  Future<void> getMovieDetailsData({required int movieId}) async {
    emit(GetMovieDetailsLoadingState());
    Either<Failure,Movie> response =
    await _getMovieDetailsUseCase.call(movieId);
    emit(response.fold((failure) =>
            GetMovieDetailsErrorState(msg: mapFailureToMsg(failure)), (movie) {
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
  int recPage=1;
  bool allRec=false;
  Future<void> getMovieRecommendations({int page=1,required movieId}) async {
    emit(GetMovieRecommendationsLoadingState());
    Either<Failure, List<Movie>> response =
    await _getMovieRecommendationsUseCase.call(movieId: movieId,page: page);
    emit(response.fold(
            (failure) =>
            GetMovieRecommendationsErrorState(msg: mapFailureToMsg(failure)),
            (movieRecommendations) {
          if(movieRecommendations.isEmpty){
            allRec=true;
          }
          for (var element in movieRecommendations) {
            if(!this.movieRecommendations!.any((e) =>e.id==element.id,))
            {
              this.movieRecommendations!.add(element);
            }
          }
          return GetMovieRecommendationsSuccessState();
        }));
  }

  List<Review>? movieReviews;
  Future<void> getMovieReviews({required movieId}) async {
    emit(GetMovieReviewsLoadingState());
    Either<Failure, List<Review>> response =
    await _getMovieReviewsUsecase.call(movieId: movieId);
    movieReviews = [];
    emit(response.fold(
            (failure) =>
                GetMovieReviewsErrorState(msg: mapFailureToMsg(failure)),
            (movieReviews) {
          this.movieReviews = movieReviews;
          return GetMovieReviewsSuccessState();
        }));
  }


  List<CastMember>? movieCredits= [];
  Future<void> getMovieCredits({required movieId}) async {
    emit(GetMovieCreditsLoadingState());
    Either<Failure, List<CastMember>> response =
    await _getMovieCreditsUsecase.call(movieId);
    movieReviews = [];
    emit(response.fold(
            (failure) =>
            GetMovieCreditsErrorState(msg: mapFailureToMsg(failure)),
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
  List<int> moviesId=[];
  void clearObjects()async{
    movie=Movie();
    allRec=false;
    recPage=1;
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
     getMovieRecommendations(movieId:moviesId[moviesId.length-1]);
    }
    else if(moviesId.length==1)
    {
      moviesId.removeAt(0);
    }
  }


  Message ? message;
  Future<void> rateMovie({required dynamic rate,required int movieId})async{
    emit(RateMovieLoadingState());
    Either<Failure, Message> response =
        await _rateMovieUseCase.call(rate:rate, movieId: movieId);
    emit(response.fold((l){
      return RateMovieErrorState(msg: mapFailureToMsg(l));

    }, (r){
      message=r;
     return RateMovieSuccessState();
    }));
  }

  Future<void> removeRateMovie({required int movieId})async{
    emit(RemoveRateMovieLoadingState());
    Either<Failure, Message> response =
    await _deleteRateMovieUseCase.call(movieId);

    emit(response.fold((l){
      return RemoveRateMovieErrorState(msg: mapFailureToMsg(l));
      }, (r){
      message=r;
      return RemoveRateMovieSuccessState();
    }));
  }

  Future<void> favMovie({required int movieId,required bool fav})async{
    emit(FavMovieLoadingState());
    Either<Failure, Message> response =
    await _markMovieAsFavUsecase.call(movieId: movieId,fav: fav);
    emit(response.fold((l){
      return FavMovieErrorState(msg: mapFailureToMsg(l));
    }, (r){
      message=r;
      return FavMovieSuccessState(statusCode: message!.statusCode!);
    }));
  }

  Future<void> addMovieToWatchList({required int movieId,required bool watchlist})async{
    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response =
    await _addMovieToWatchListUseCase.call(movieId: movieId,watchlist: watchlist);
    emit(response.fold((l){
      return AddToWatchListErrorState(msg: mapFailureToMsg(l));
    }, (r){
      message=r;
      return AddToWatchListSuccessState(statusCode: message!.statusCode!
      );
    }));
  }
}