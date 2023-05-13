import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_movies_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_movie_cubit/account_fav_movie_state.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class AccountFavMovieCubit extends Cubit<AccountFavMovieStates> {
  AccountFavMovieCubit(this._getFavMoviesListUsecase) : super(AccountFavMovieInitialState());
  final GetFavMoviesListUsecase _getFavMoviesListUsecase;
  static AccountFavMovieCubit get(context)=>BlocProvider.of(context);
  List<Movie> fav=[];
  Future<void> getAccountFavoriteMovies()async{
    emit(GetAccountsFavoriteMoviesListLoadingState());
    Either<Failure, List<Movie>> favMovies =await _getFavMoviesListUsecase.call();
    favMovies.fold((l){
      emit(GetAccountsFavoriteMoviesListErrorState( msg: mapFailureToMsg(l)));
    },(r){
      fav.clear();
      fav=r;
      emit(GetAccountsFavoriteMoviesListSuccessState());
    });
  }
  initial(){
    emit(AccountFavMovieInitialState());
  }
  update(){
    emit(UpdateState());
  }
}
