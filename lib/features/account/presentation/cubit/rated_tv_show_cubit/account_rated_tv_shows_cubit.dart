import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'account_rated_tv_shows_state.dart';
class AccountRatedTvShowsCubit extends Cubit<AccountRatedTvShowsStates> {
  AccountRatedTvShowsCubit(this._getRatedTvShowListUsecase) : super(AccountRatedTvShowsInitialState());
  final GetAccountTvShowListUsecase _getRatedTvShowListUsecase;
  static AccountRatedTvShowsCubit get(context)=>BlocProvider.of(context);
  List<TvShow> ratedTvShows=[];
  Future<void> getAccountRatedTvShows()async{
    emit(GetAccountsRatedTvShowListLoadingState());
    Either<Failure, List> ratedTvShows =await _getRatedTvShowListUsecase.call(listType: "rated",mediaType: "tv");
    ratedTvShows.fold((l){
      emit(GetAccountsRatedTvShowListErrorState( msg: mapFailureToMsg(l)));
    },(r){
      this.ratedTvShows.clear();
      this.ratedTvShows=r as List<TvShow>;
      emit(GetAccountsRatedTvShowListSuccessState());
    });
  }
  initial(){
    emit(AccountRatedTvShowsInitialState());
  }
  update(){
    emit(UpdateState());
  }
}