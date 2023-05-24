import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_movie_cubit/account_fav_movie_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_as_fav_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_state.dart';
class MovieButtonsCubit extends Cubit<MovieButtonsStates> {
  MovieButtonsCubit(this._deleteRateMovieUseCase, this._rateMovieUseCase,
      this._markMovieUsecase)
      : super(RateMovieInitialState());
  final RateMovieUseCase _rateMovieUseCase;
  final DeleteRateMovieUseCase _deleteRateMovieUseCase;
  final MarkMovieUsecase _markMovieUsecase;
  static MovieButtonsCubit get(context)=>BlocProvider.of(context);
  Movie ?movie;
  Future<void> rateMovie({required dynamic rate,required int movieId})async{
    emit(RateMovieLoadingState());
    Either<Failure, Message> response;
    if(rate>0) {
      response=await _rateMovieUseCase.call(rate:rate, movieId: movieId);
    }
    else{
      response =await _deleteRateMovieUseCase.call(movieId: movieId);
    }
    emit(response.fold((l)=>RateMovieErrorState(msg: mapFailureToMsg(l))
        ,(r)=> RateMovieSuccessState(r.statusCode!)));
  }
   rate(rate,context){
    if(rate==0)
      {
        rateMovie(movieId: movie!.id!, rate: 0.0);
        movie!.movieAccountDetails!.ratedValue=0.0;
        movie!.movieAccountDetails!.watchlist = false;
        AccountRatedMovieCubit.get(context).ratedMovies.removeWhere((element) =>element.id==movie!.id);
        AccountRatedMovieCubit.get(context).update();
        AccountMovieWatchlistCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie!.id);
        AccountMovieWatchlistCubit.get(context).update();
      }
    else if(rate >0.0)
      {
        rateMovie(rate: movie!.movieAccountDetails!.ratedValue, movieId: movie!.id!);
        movie!.movieAccountDetails!.watchlist = false;
        if(AccountRatedMovieCubit.get(context).ratedMovies.any((element) => element.id == movie!.id))
        {
          AccountRatedMovieCubit.get(context).ratedMovies.firstWhere((element) => element.id == movie!.id)
              .movieAccountDetails!.ratedValue =
              movie!.movieAccountDetails!.ratedValue;
          AccountRatedMovieCubit.get(context).update();
        }
        else{
          AccountRatedMovieCubit.get(context).ratedMovies.add(movie!);
          AccountRatedMovieCubit.get(context).update();
        }
        AccountMovieWatchlistCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie!.id,);
        AccountMovieWatchlistCubit.get(context).update();
      }
   }
  Future<void> favMovie({required int movieId, required bool fav}) async {
    emit(FavMovieLoadingState());
    Either<Failure, Message> response =
    await _markMovieUsecase.call(movieId: movieId, mark: fav,markType: "favorite");
    emit(response.fold((l) => FavMovieErrorState(msg: mapFailureToMsg(l)),
            (r) => FavMovieSuccessState(statusCode: r.statusCode!)));
  }
  markFav(context){
    if(movie!.movieAccountDetails!.favorite!){
      movie!.movieAccountDetails!.favorite =false;
      favMovie(movieId: movie!.id!,fav: false);
      AccountFavMovieCubit.get(context).fav.removeWhere((element) => element.id==movie!.id);
      AccountFavMovieCubit.get(context).update();
    }
    else{
      movie!.movieAccountDetails!.favorite =true;
      favMovie(movieId: movie!.id!,fav: true);
      AccountFavMovieCubit.get(context).fav.add(movie!);
      AccountFavMovieCubit.get(context).update();
    }
  }
  Future<void> addMovieToWatchList({required int movieId, required bool watchlist}) async {
    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response = await _markMovieUsecase.call(
        movieId: movieId, mark:  watchlist,markType: "watchlist");
    emit(response.fold((l) => AddToWatchListErrorState(msg: mapFailureToMsg(l)),
            (r) => AddToWatchListSuccessState(statusCode: r.statusCode!)));
  }
  addToWatchlist(context){
    if (movie!.movieAccountDetails!.watchlist!) {
      movie!.movieAccountDetails!.watchlist=false;
      addMovieToWatchList(movieId: movie!.id!, watchlist: false);
      AccountMovieWatchlistCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie!.id);
      AccountMovieWatchlistCubit.get(context).update();
    } else {
      movie!.movieAccountDetails!.watchlist=true;
      addMovieToWatchList(movieId: movie!.id!, watchlist: true);
      AccountMovieWatchlistCubit.get(context).moviesWatchlist.add(movie!);
      AccountMovieWatchlistCubit.get(context).update();
    }
  }
}
