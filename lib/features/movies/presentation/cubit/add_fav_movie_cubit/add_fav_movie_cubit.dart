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
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_as_fav_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_fav_movie_cubit/add_fav_movie_state.dart';
class AddFavMovieCubit extends Cubit<AddFavMovieStates> {
  AddFavMovieCubit(this._markMovieAsFavUsecase) : super(AddFavMovieInitialState());
  static AddFavMovieCubit get(context) => BlocProvider.of(context);
  final MarkMovieAsFavUsecase _markMovieAsFavUsecase;
  Future<void> favMovie({required int movieId, required bool fav}) async {
    emit(FavMovieLoadingState());
    Either<Failure, Message> response =
        await _markMovieAsFavUsecase.call(movieId: movieId, fav: fav);
    emit(response.fold((l) => FavMovieErrorState(msg: mapFailureToMsg(l)),
            (r) => FavMovieSuccessState(statusCode: r.statusCode!)));
  }
  markFav(Movie movie,context){
    if(AppStrings.sessionId!="")
    {
      if(movie.movieAccountDetails!.favorite!){
        favMovie(movieId: movie.id!,fav: false);
        movie.movieAccountDetails!.favorite =false;
        AccountCubit.get(context).favMovies.removeWhere((element) => element.id==movie.id,);
        AccountCubit.get(context).update();
      }
      else{
       favMovie(movieId: movie.id!,fav: true);
        movie.movieAccountDetails!.favorite =true;
       AccountCubit.get(context).favMovies.add(movie);
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