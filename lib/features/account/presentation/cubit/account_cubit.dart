import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
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
  AccountCubit({
    required this.getFavMoviesListUsecase,
    required this.getMoviesWatchlistUsecase,
    required this.getRatedMoviesListUsecase,
    required this.getAccountDetailsUsecase,
    required this.getFavTvShowsListUsecase,
    required this.getTvShowsWatchlistUsecase,
    required this.getRatedTvShowListUsecase,
  }) : super(AccountInitialState());
  
  GetRatedMoviesListUsecase getRatedMoviesListUsecase;
  GetMoviesWatchlistUsecase getMoviesWatchlistUsecase;
  GetFavMoviesListUsecase getFavMoviesListUsecase;
  GetAccountDetailsUsecase getAccountDetailsUsecase;
  GetTvShowsWatchlistUsecase getTvShowsWatchlistUsecase;
  GetFavTvShowsListUsecase getFavTvShowsListUsecase;
  GetRatedTvShowListUsecase getRatedTvShowListUsecase;
  
  List<Movie> ratedMovies=[];
  List<Movie> favMovies=[];
  List<Movie> moviesWatchlist=[];
  List<TvShow> ratedTvShows=[];
  List<TvShow> favTvShows=[];
  List<TvShow> tvShowsWatchlist=[];

  
  Future<void> getLists()async {
    emit(GetAccountsListsLoadingState());
    Either<Failure, List<Movie>> favMovies =await getFavMoviesListUsecase.call(const NoParameters());
    Either<Failure, List<Movie>> ratedMovies =await getRatedMoviesListUsecase.call(const NoParameters());
    Either<Failure, List<Movie>> moviesWatchlist =await getMoviesWatchlistUsecase.call(const NoParameters());
    Either<Failure, List<TvShow>> favTvShows =await getFavTvShowsListUsecase.call(const NoParameters());
    Either<Failure, List<TvShow>> ratedTvShows =await getRatedTvShowListUsecase.call(const NoParameters());
    Either<Failure, List<TvShow>> tvShowsWatchlist =await getTvShowsWatchlistUsecase.call(const NoParameters());
    favMovies.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    },(r){
      this.favMovies=r;
    });
    ratedMovies.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    }, (r){
      this.ratedMovies=r;
    });
    moviesWatchlist.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    },(r){
      this.moviesWatchlist=r;
    });
    favTvShows.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    },(r){
      this.favTvShows=r;
    });
    ratedTvShows.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    },(r){
      this.ratedTvShows=r;
    });
    tvShowsWatchlist.fold((l){
      emit(GetAccountsListsErrorState( msg: _mapFailureToMsg(l)));
    },(r){
      this.tvShowsWatchlist=r;
    });
    emit(GetAccountsListsSuccessState());
  }

  Account ?account;
  Future<void> getAccountDetails()async {
    emit(GetAccountsDetailsLoadingState());
    Either<Failure, Account> res =await getAccountDetailsUsecase.call(const NoParameters());

    emit(res.fold((l) {
      return GetAccountsDetailsErrorState(msg: _mapFailureToMsg(l));
    }, (r) {
      account = r;
      return GetAccountsDetailsSuccessState();
    }));
  }

update(){
    emit(GetUpdateDetailsLoadingState());
    emit(GetUpdateDetailsSuccessState());
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
