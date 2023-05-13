import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/rate_movie_cubit/rate_movie_state.dart';
class RateMovieCubit extends Cubit<RateMovieStates> {
  RateMovieCubit( this._deleteRateMovieUseCase,this._rateMovieUseCase) : super(RateMovieInitialState());
  final RateMovieUseCase _rateMovieUseCase;
  final DeleteRateMovieUseCase _deleteRateMovieUseCase;
  static RateMovieCubit get(context)=>BlocProvider.of(context);
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
   rate(BuildContext context,Movie movie,Widget ratingbar){
     if(AppStrings.sessionId!="")
     {
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             contentPadding:
             const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
             actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
             elevation: 5,
             content: ratingbar,
             actions: [
               IconButton(
                   tooltip: "remove rating",
                   iconSize: 25,
                   icon: const Icon(Icons.remove_circle_outline),
                   onPressed: () {
                     rateMovie(movieId: movie.id!, rate: 0.0);
                     movie.movieAccountDetails!.ratedValue=0.0;
                     movie.movieAccountDetails!.watchlist = false;
                     AccountRatedMovieCubit.get(context).ratedMovies.removeWhere((element) =>element.id==movie.id);
                     AccountMovieWatchlistCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie.id);
                     Navigator.of(context).pop();
                   }),
               TextButton(
                 child: const Text('Rate'),
                 onPressed: () {
                   if (movie.movieAccountDetails!.ratedValue != 0.0) {
                    rateMovie(rate: movie.movieAccountDetails!.ratedValue, movieId: movie.id!);
                     movie.movieAccountDetails!.watchlist = false;
                     if(AccountRatedMovieCubit.get(context).ratedMovies.any((element) => element.id == movie.id))
                     {
                       AccountRatedMovieCubit.get(context).ratedMovies.firstWhere((element) => element.id == movie.id)
                           .movieAccountDetails!.ratedValue =
                           movie.movieAccountDetails!.ratedValue;
                     }
                     else{
                       AccountRatedMovieCubit.get(context).ratedMovies.add(movie);
                     }
                    AccountMovieWatchlistCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie.id,);
                   }
                   Navigator.of(context).pop();
                 },
               ),
             ],
           );
         },
       );
     }
     else{
       showDialog(
         context: context,
         builder: (BuildContext dialogContext) {
           return const LoginAlert();
         },
       );
     }
   }
}
