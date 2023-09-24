import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
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
    initialRating=0;
    on<RateTvShowEvent>((event, emit) => rateTvShow(emit,event.rate),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<FavTvShowEvent>((event, emit) => favTvShow(emit,event.fav),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<WatchListTvShowEvent>((event, emit) => addTvShowToWatchList(emit,event.add),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
  }
  static TvActionsBloc get(context)=>BlocProvider.of(context);
  late TvShow tvShow;
  late double initialRating;
  Future<void> rateTvShow(emit,rate)async{
    emit(ActionLoadingState());
    bool watchList= tvShow.tvShowAccountDetails!.watchlist!;
    Either<Failure, Message> response;
    if(rate>0){
      tvShow.tvShowAccountDetails!.watchlist = false;
      response =await _rateTvShowUseCase.call(rate:rate, tvId: tvShow.id);
    }
    else{
      tvShow.tvShowAccountDetails!.ratedValue=0.0;
      tvShow.tvShowAccountDetails!.watchlist = false;
      response=await _deleteTvShowRateUseCase.call(tvId: tvShow.id);
    }
    emit(response.fold(
        (l){
          tvShow.tvShowAccountDetails!.ratedValue=initialRating;
          tvShow.tvShowAccountDetails!.watchlist=watchList;
          return ActionErrorState(where: "rate");
        },
        (r)=>ActionSuccessState()));
  }
  Future<void> favTvShow(emit,bool fav)async{
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(tvId: tvShow.id,mark: fav,markType: "favorite");
    emit(response.fold(
        (l){
          tvShow.tvShowAccountDetails!.favorite=!tvShow.tvShowAccountDetails!.favorite!;
          return ActionErrorState(where: "fav");
        },
        (r)=> ActionSuccessState()));
  }
  Future<void> addTvShowToWatchList(emit,bool watchlist)async{
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markTvShowAsFavUsecase.call(tvId: tvShow.id,mark: watchlist,markType: "watchlist");
    emit(response.fold(
        (l){
          tvShow.tvShowAccountDetails!.watchlist=!tvShow.tvShowAccountDetails!.watchlist!;
          return ActionErrorState(where: "watchList");
        },
        (r)=>ActionSuccessState()));
  }
}