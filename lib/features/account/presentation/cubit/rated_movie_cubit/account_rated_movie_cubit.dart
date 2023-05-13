import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_movies_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_state.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class AccountRatedMovieCubit extends Cubit<AccountRatedMovieStates> {
  AccountRatedMovieCubit(this._getRatedMoviesListUsecase) : super(AccountRatedMovieInitialState());
  final GetRatedMoviesListUsecase _getRatedMoviesListUsecase;
  static AccountRatedMovieCubit get(context)=>BlocProvider.of(context);
  List<Movie> ratedMovies=[];
  Future<void>getAccountRatedMovieList()async{
    emit(GetAccountsRatedMoviesListLoadingState());
    Either<Failure, List<Movie>> ratedMovies =await _getRatedMoviesListUsecase.call();
    ratedMovies.fold((l){
      emit(GetAccountsRatedMoviesListErrorState( msg: mapFailureToMsg(l)));
    }, (r){
      this.ratedMovies.clear();
      this.ratedMovies=r;
      emit(GetAccountsRatedMoviesListSuccessState());
    });
  }
  initial(){
    emit(AccountRatedMovieInitialState());
  }
  update(){
    emit(UpdateState());
  }
}