import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_as_fav_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_cubit/tv_show_buttons_state.dart';
class TvShowButtonsCubit extends Cubit<TvShowButtonsStates> {
  TvShowButtonsCubit(
      this._markTvShowAsFavUsecase,
      this._deleteTvShowRateUseCase,
      this._rateTvShowUseCase) : super(TvShowButtonsInitialState());
  final MarkTvShowUsecase _markTvShowAsFavUsecase;
  final RateTvShowUseCase _rateTvShowUseCase;
  final DeleteTvShowRateUseCase _deleteTvShowRateUseCase;
  static TvShowButtonsCubit get(context)=>BlocProvider.of(context);
  TvShow ?tvShow;
  Future<void> favTvShow({required int tvId,required bool fav})async{
    emit(FavTvShowLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(tvId: tvId,mark: fav,markType: "favorite");
    emit(response.fold((l){
      return FavTvShowErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return FavTvShowSuccessState(statusCode: r.statusCode!);
    }));
  }
  Future<void> addTvShowToWatchList({required int tvId,required bool watchlist})async{
    emit(AddToWatchListLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(tvId: tvId,mark: watchlist,markType: "watchlist");
    emit(response.fold((l){
      return AddToWatchListErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return AddToWatchListSuccessState(statusCode: r.statusCode!
      );
    }));
  }
  Future<void> rateTvShow({required dynamic rate,required int tvId})async{
    emit(RateTvShowLoadingState());
    Either<Failure, Message> response;
    if(rate>0){
      response =await _rateTvShowUseCase.call(rate:rate, tvId: tvId);
    }
    else
      {
        response=await _deleteTvShowRateUseCase.call(tvId: tvId);
      }
    emit(response.fold((l){
      return RateTvShowErrorState(msg: mapFailureToMsg(l));
    }, (r){
      return RateTvShowSuccessState(r.statusCode!);
    }));
  }
  markFav(context,listType){
    if(tvShow!.tvShowAccountDetails!.favorite!){
      favTvShow(tvId: tvShow!.id!, fav: false);
      tvShow!.tvShowAccountDetails!.favorite =false;
      if(listType=="favorite"){
        AccountListsCubit.get(context).list.removeWhere((element) => element.id == tvShow!.id);
        AccountListsCubit.get(context).update();
      }
    }
    else{
      favTvShow(tvId: tvShow!.id!, fav: true);
      tvShow!.tvShowAccountDetails!.favorite =true;
    }
  }
  addToWatchlist(context,listType){
    if (tvShow!.tvShowAccountDetails!.watchlist!) {
      addTvShowToWatchList(tvId: tvShow!.id!, watchlist: false);
      tvShow!.tvShowAccountDetails!.watchlist=false;
     if(listType=="watchlist")
       {
         AccountListsCubit.get(context).list.removeWhere((element) => element.id==tvShow!.id);
         AccountListsCubit.get(context).update();
       }
    }
    else {
      addTvShowToWatchList(tvId: tvShow!.id!, watchlist: true);
      tvShow!.tvShowAccountDetails!.watchlist=true;
    }
  }
  rate(rate,context,listType){
    if(rate==0.0)
      {
        rateTvShow(tvId: tvShow!.id!,rate: rate);
        tvShow!.tvShowAccountDetails!.ratedValue=0.0;
        tvShow!.tvShowAccountDetails!.watchlist = false;
        if(listType=='rated'){
        AccountListsCubit.get(context).list.removeWhere((element) => element.id == tvShow!.id);
        AccountListsCubit.get(context).update();
      }
    }
    else if(rate>0.0)
      {
        rateTvShow(rate: rate, tvId: tvShow!.id!);
        tvShow!.tvShowAccountDetails!.watchlist = false;
      }
  }
}
