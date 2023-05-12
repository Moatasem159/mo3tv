import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_movies_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_tv_shows_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_movies_watchlist_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_movies_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_tv_shows_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_tv_shows_watchlist_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class AccountCubit extends Cubit<AccountStates> {
  AccountCubit(
     this._getFavMoviesListUsecase,
     this._getMoviesWatchlistUsecase,
     this._getRatedMoviesListUsecase,
     this._getAccountDetailsUsecase,
     this._getFavTvShowsListUsecase,
     this._getTvShowsWatchlistUsecase,
     this._getRatedTvShowListUsecase,
  ):super(AccountInitialState());
  static AccountCubit get(context)=>BlocProvider.of(context);
  final GetRatedMoviesListUsecase _getRatedMoviesListUsecase;
  final GetMoviesWatchlistUsecase _getMoviesWatchlistUsecase;
  final GetFavMoviesListUsecase _getFavMoviesListUsecase;
  final GetAccountDetailsUsecase _getAccountDetailsUsecase;
  final GetTvShowsWatchlistUsecase _getTvShowsWatchlistUsecase;
  final GetFavTvShowsListUsecase _getFavTvShowsListUsecase;
  final GetRatedTvShowListUsecase _getRatedTvShowListUsecase;
  List<Movie> ratedMovies=[];
  List<Movie> favMovies=[];
  List<Movie> moviesWatchlist=[];
  List<TvShow> ratedTvShows=[];
  List<TvShow> favTvShows=[];
  List<TvShow> tvShowsWatchlist=[];
  Future<void> getLists()async {
    if(AppStrings.sessionId!=""){
      emit(GetAccountsListsLoadingState());
      Either<Failure, List<Movie>> favMovies =await _getFavMoviesListUsecase.call();
      Either<Failure, List<Movie>> ratedMovies =await _getRatedMoviesListUsecase.call();
      Either<Failure, List<Movie>> moviesWatchlist =await _getMoviesWatchlistUsecase.call();
      Either<Failure, List<TvShow>> favTvShows =await _getFavTvShowsListUsecase.call();
      Either<Failure, List<TvShow>> ratedTvShows =await _getRatedTvShowListUsecase.call();
      Either<Failure, List<TvShow>> tvShowsWatchlist =await _getTvShowsWatchlistUsecase.call();
      favMovies.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.favMovies.clear();
        this.favMovies=r;
      });
      ratedMovies.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      }, (r){
        this.ratedMovies.clear();
        this.ratedMovies=r;
      });
      moviesWatchlist.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.moviesWatchlist.clear();
        this.moviesWatchlist=r;
      });
      favTvShows.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.favTvShows.clear();
        this.favTvShows=r;
      });
      ratedTvShows.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.ratedTvShows.clear();
        this.ratedTvShows=r;
      });
      tvShowsWatchlist.fold((l){
        emit(GetAccountsListsErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.tvShowsWatchlist.clear();
        this.tvShowsWatchlist=r;
      });
      emit(GetAccountsListsSuccessState());
    }
  }
  Account ?account;
  Future<void> getAccountDetails()async {
    if(AppStrings.sessionId!="") {
      emit(GetAccountsDetailsLoadingState());
      Either<Failure, Account> res =await _getAccountDetailsUsecase.call();
      emit(res.fold((l){
        return GetAccountsDetailsErrorState(msg: mapFailureToMsg(l));
      }, (r) {
        account = r;
        return GetAccountsDetailsSuccessState();
      }));
    }

  }
  update(){
    emit(GetUpdateDetailsSuccessState());
}

  clear(){
  account=null;
  ratedMovies.clear();
  favMovies.clear();
  moviesWatchlist.clear();
   ratedTvShows.clear();
   favTvShows.clear();
   tvShowsWatchlist.clear();
  emit(ClearState());
}
}