import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_movies_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_state.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class AccountMovieWatchlistCubit extends Cubit<AccountMovieWatchlistStates> {
  AccountMovieWatchlistCubit( this._getMoviesWatchlistUsecase) : super(MovieWatchlistInitialState());
  final GetAccountMoviesListUsecase _getMoviesWatchlistUsecase;
  static AccountMovieWatchlistCubit get(context)=>BlocProvider.of(context);
  List<Movie> moviesWatchlist=[];
  Future<void> getMoviesWatchlist()async{
    emit(GetAccountsMovieWatchlistLoadingState());
    Either<Failure, List> moviesWatchlist =await _getMoviesWatchlistUsecase.call(listType: "watchlist",mediaType: "movies");
    moviesWatchlist.fold((l){
      emit(GetAccountsMovieWatchlistErrorState( msg: mapFailureToMsg(l)));
    },(r){
      this.moviesWatchlist.clear();
      this.moviesWatchlist=r as List<Movie>;
      emit(GetAccountsMovieWatchlistSuccessState());
    });
  }
  initial(){
    emit(MovieWatchlistInitialState());
  }
  update(){
    emit(UpdateState());
  }
}
