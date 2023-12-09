import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_events.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_show_actions_state.dart';
import 'package:rxdart/transformers.dart';
class TvActionsBloc extends Bloc<TvActionsEvents,TvShowActionsStates>{
  final RateTvShowUseCase _rateTvShowUseCase;
  final MarkTvShowUsecase _markTvShowAsFavUsecase;
  final DeleteTvShowRateUseCase _deleteTvShowRateUseCase;
  TvActionsBloc(this._deleteTvShowRateUseCase, this._markTvShowAsFavUsecase,this._rateTvShowUseCase)
      : super(TvShowActionsInitialState()){
    on<RateTvShowEvent>((event, emit) => rateTvShow(emit,event.rate),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<FavTvShowEvent>((event, emit) => favTvShow(emit,event.fav),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<WatchListTvShowEvent>((event, emit) => addTvShowToWatchList(emit,event.add),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
  }
  static TvActionsBloc get(context)=>BlocProvider.of(context);
  late TvShow tvShow;
  Future<void> rateTvShow(emit,rate)async{
    emit(ActionLoadingState());
    bool watchList= tvShow.mediaAccountDetails!.watchlist;
    dynamic oldRate=tvShow.mediaAccountDetails!.ratedValue!;
    Either<Failure, Message> response;
    if(rate>0){
      tvShow.mediaAccountDetails!.watchlist = false;
      response =await _rateTvShowUseCase.call(MediaParams(rate: rate ,mediaId: tvShow.id,mediaType: AppStrings.tv));
    }
    else{
      tvShow.mediaAccountDetails!.ratedValue=0.0;
      tvShow.mediaAccountDetails!.watchlist = false;
      response=await _deleteTvShowRateUseCase.call(MediaParams(mediaId: tvShow.id,mediaType: AppStrings.tv));
    }
    emit(response.fold(
        (l){
          tvShow.mediaAccountDetails!.ratedValue=oldRate;
          tvShow.mediaAccountDetails!.watchlist=watchList;
          return ActionErrorState(where: "rate");
        },
        (r)=>ActionSuccessState()));
  }
  Future<void> favTvShow(emit,bool fav)async{
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(MediaParams(mediaId: tvShow.id, mediaType: AppStrings.tv,mark: fav,markType:'favorite'));
    emit(response.fold(
        (l){
          tvShow.mediaAccountDetails!.favorite=!tvShow.mediaAccountDetails!.favorite;
          return ActionErrorState(where: "fav");
        },
        (r)=> ActionSuccessState()));
  }
  Future<void> addTvShowToWatchList(emit,bool watchlist)async{
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(MediaParams(mediaId: tvShow.id, mediaType: AppStrings.tv,mark: watchlist,markType:'watchlist'));
    emit(response.fold(
        (l){
          tvShow.mediaAccountDetails!.watchlist=!tvShow.mediaAccountDetails!.watchlist;
          return ActionErrorState(where: "watchList");
        },
        (r)=>ActionSuccessState()));
  }
}