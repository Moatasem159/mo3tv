import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/add_movie_to_watchlist_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_watch_list_cubit/watch_list_movie_state.dart';
class WatchListMovieCubit extends Cubit<WatchListMovieStates> {
  WatchListMovieCubit(this._addMovieToWatchListUseCase):super(WatchListMovieInitialState());
  static WatchListMovieCubit get(context)=>BlocProvider.of(context);
  final AddMovieToWatchListUseCase _addMovieToWatchListUseCase;
  Future<void> addMovieToWatchList(
      {required int movieId, required bool watchlist}) async {
    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response = await _addMovieToWatchListUseCase.call(
        movieId: movieId, watchlist: watchlist);
    emit(response.fold((l) => AddToWatchListErrorState(msg: mapFailureToMsg(l)),
        (r) => AddToWatchListSuccessState(statusCode: r.statusCode!)));
  }


  add(BuildContext context,Movie movie){
    if(AppStrings.sessionId!='')
    {
      if (movie.movieAccountDetails!.watchlist!) {
        addMovieToWatchList(movieId: movie.id!, watchlist: false);
        movie.movieAccountDetails!.watchlist=false;
        AccountCubit.get(context).moviesWatchlist.removeWhere((element) => element.id==movie.id);
        AccountCubit.get(context).update();
      } else {
       addMovieToWatchList(movieId: movie.id!, watchlist: true);
        movie.movieAccountDetails!.watchlist=true;
       AccountCubit.get(context).moviesWatchlist.add(movie);
       AccountCubit.get(context).update();
      }
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