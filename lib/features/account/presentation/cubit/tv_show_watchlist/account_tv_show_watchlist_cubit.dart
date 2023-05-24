import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/tv_show_watchlist/account_tv_show_watchlist_state.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class AccountTvShowWatchlistCubit extends Cubit<AccountTvShowWatchlistStates> {
  AccountTvShowWatchlistCubit(this._getTvShowsWatchlistUsecase) : super(AccountTvShowWatchlistInitialState());
  final GetAccountTvShowListUsecase _getTvShowsWatchlistUsecase;
  static AccountTvShowWatchlistCubit get(context)=>BlocProvider.of(context);
  List<TvShow> tvShowsWatchlist=[];
  Future<void> getAccountTvShowWatchlist()async {
      emit(GetAccountsTvShowWatchlistLoadingState());
      Either<Failure, List> tvShowsWatchlist =await _getTvShowsWatchlistUsecase.call(listType: "watchlist",mediaType: "tv");
      tvShowsWatchlist.fold((l){
        emit(GetAccountsTvShowWatchlistErrorState( msg: mapFailureToMsg(l)));
      },(r){
        this.tvShowsWatchlist.clear();
        this.tvShowsWatchlist=r as List<TvShow>;
        emit(GetAccountsTvShowWatchlistSuccessState());
      });
  }

  initial(){
    emit(AccountTvShowWatchlistInitialState());
  }
  update(){
    emit(UpdateState());
  }
}
