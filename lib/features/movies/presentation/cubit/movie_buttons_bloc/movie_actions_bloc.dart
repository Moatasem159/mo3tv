import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_events.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_state.dart';
import 'package:rxdart/transformers.dart';
class MovieActionsBloc extends Bloc<MovieActionsEvents, MovieActionsStates>{
  final RateMovieUseCase _rateMovieUseCase;
  final MarkMovieUsecase _markMovieUsecase;
  final DeleteRateMovieUseCase _deleteRateMovieUseCase;
  MovieActionsBloc(this._deleteRateMovieUseCase,this._rateMovieUseCase,this._markMovieUsecase)
    :super(RateMovieInitialState()){
    on<RateMovieEvent>((event, emit) => rateMovie(emit,event.rate),
      transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<FavMovieEvent>((event, emit) => favMovie(emit,event.fav),
    transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
    on<WatchListMovieEvent>((event, emit) => addMovieToWatchList(emit,event.add),
    transformer: (eventsStream, mapper) => eventsStream.distinct().switchMap(mapper));
  }
  static MovieActionsBloc get(context)=>BlocProvider.of(context);
  late Movie movie;
  Future<void> rateMovie(emit,double rate)async{
    emit(ActionLoadingState());
    bool watchList= movie.mediaAccountDetails!.watchlist;
    dynamic oldRate= movie.mediaAccountDetails!.ratedValue;
    Either<Failure, Message> response;
    if(rate>0) {
      movie.mediaAccountDetails!.watchlist = false;
      response=await _rateMovieUseCase.call(rate:rate, movieId: movie.id);
    }
    else{
      movie.mediaAccountDetails!.ratedValue=0.0;
      movie.mediaAccountDetails!.watchlist = false;
      response =await _deleteRateMovieUseCase.call(movieId: movie.id);
    }
    emit(response.fold(
            (l){
              movie.mediaAccountDetails!.ratedValue=oldRate;
              movie.mediaAccountDetails!.watchlist=watchList;
              return ActionErrorState(where: "rate");
            },
            (r)=> ActionSuccessState()));
  }
  Future<void> favMovie(emit, bool fav)async{
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markMovieUsecase.call(movieId: movie.id, mark: fav,markType: "favorite");
    emit(response.fold(
        (l){
          movie.mediaAccountDetails!.favorite= !movie.mediaAccountDetails!.favorite;
          return ActionErrorState(where: "fav");
        },
        (r) => ActionSuccessState()));
  }
  Future<void> addMovieToWatchList(emit, bool add) async {
    emit(ActionLoadingState());
    Either<Failure, Message> response =
    await _markMovieUsecase.call(movieId: movie.id, mark:add,markType: "watchlist");
    emit(response.fold(
            (l){
              movie.mediaAccountDetails!.watchlist= !movie.mediaAccountDetails!.watchlist;
              return ActionErrorState(where: "watchList");
            },
            (r) => ActionSuccessState()));
  }
}