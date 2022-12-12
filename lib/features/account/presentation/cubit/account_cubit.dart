import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_movies_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_movies_watchlist_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_movies_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class AccountCubit extends Cubit<AccountStates> {
  AccountCubit({
    required this.getFavMoviesListUsecase,
    required this.getMoviesWatchlistUsecase,
    required this.getRatedMoviesListUsecase,
  }) : super(AccountInitialState());
  
  GetRatedMoviesListUsecase getRatedMoviesListUsecase;
  GetMoviesWatchlistUsecase getMoviesWatchlistUsecase;
  GetFavMoviesListUsecase getFavMoviesListUsecase;
  
  List<Movie> ?ratedMovies;
  List<Movie> ?favMovies;
  List<Movie> ?moviesWatchlist;
  
  Future<void> getLists()async {
    emit(GetAccountsListsLoadingState());
    Either<Failure, List<Movie>> favMovies =await getFavMoviesListUsecase.call(const NoParameters());
    Either<Failure, List<Movie>> ratedMovies =await getRatedMoviesListUsecase.call(const NoParameters());
    Either<Failure, List<Movie>> moviesWatchlist =await getMoviesWatchlistUsecase.call(const NoParameters());
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
    emit(GetAccountsListsSuccessState());
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
