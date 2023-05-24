import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_tv_show_cubit/account_fav_tv_show_state.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class AccountFavTvShowCubit extends Cubit<AccountFavTvShowStates> {
  AccountFavTvShowCubit(this._getFavTvShowsListUsecase) : super(AccountFavTvShowInitialState());
  final GetAccountTvShowListUsecase _getFavTvShowsListUsecase;
  static AccountFavTvShowCubit get(context)=>BlocProvider.of(context);
  List<TvShow> favTvShows=[];
  Future<void>getAccountFavTvShows()async{
    emit(GetAccountsFavoriteTvShowListLoadingState());
    Either<Failure, List> favTvShows =await _getFavTvShowsListUsecase.call(listType: "favorite",mediaType: "tv");
    favTvShows.fold((l){
      emit(GetAccountsFavoriteTvShowListErrorState( msg: mapFailureToMsg(l)));
    },(r){
      this.favTvShows.clear();
      this.favTvShows=r as List<TvShow>;
      emit(GetAccountsFavoriteTvShowListSuccessState());
    });
  }
  initial(){
    emit(AccountFavTvShowInitialState());
  }
  update(){
    emit(UpdateState());
  }
}
