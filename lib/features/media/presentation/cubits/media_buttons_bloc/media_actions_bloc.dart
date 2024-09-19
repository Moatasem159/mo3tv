import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/media/domain/usecases/delete_rate_media_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/mark_media_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/rate_media_usecase.dart';
import 'package:rxdart/transformers.dart';

part 'media_actions_events.dart';

part 'media_actions_state.dart';

class MediaActionsBloc extends Bloc<MediaActionsEvents, MediaActionsStates> {
  final RateMediaUseCase _rateMediaUseCase;
  final MarkMediaUsecase _markMediaUsecase;
  final DeleteRateMediaUseCase _deleteRateMediaUseCase;

  MediaActionsBloc(this._deleteRateMediaUseCase, this._rateMediaUseCase,
      this._markMediaUsecase)
      : super(RateMediaInitialState()) {
    on<RateMediaEvent>((event, emit) => rateMedia(emit, event.rate),
        transformer: (eventsStream, mapper) =>
            eventsStream.distinct().switchMap(mapper));
    on<FavMediaEvent>((event, emit) => favMedia(emit, event.fav),
        transformer: (eventsStream, mapper) =>
            eventsStream.distinct().switchMap(mapper));
    on<WatchListMediaEvent>(
        (event, emit) => addMediaToWatchList(emit, event.add),
        transformer: (eventsStream, mapper) =>
            eventsStream.distinct().switchMap(mapper));
  }

  static MediaActionsBloc get(context) => BlocProvider.of(context);
  late Media media;
  late String mediaType;

  Future<void> rateMedia(emit, double rate) async {
    emit(ActionLoadingState());
    bool watchList = media.mediaAccountDetails!.watchlist;
    dynamic oldRate = media.mediaAccountDetails!.ratedValue;
    ApiResult<Message> response;
    if (rate > 0) {
      media.mediaAccountDetails!.watchlist = false;
      response = await _rateMediaUseCase.call(
          MediaParams(rate: rate, mediaId: media.id, mediaType: mediaType));
    } else {
      media.mediaAccountDetails!.ratedValue = 0.0;
      media.mediaAccountDetails!.watchlist = false;
      response = await _deleteRateMediaUseCase
          .call(MediaParams(mediaId: media.id, mediaType: mediaType));
    }
    switch (response) {
      case ApiSuccess<Message>():
        emit(ActionSuccessState());
      case ApiFailure<Message>():
        media.mediaAccountDetails!.ratedValue = oldRate;
        media.mediaAccountDetails!.watchlist = watchList;
        emit(ActionErrorState(where: "rate"));
    }
  }

  Future<void> favMedia(emit, bool fav) async {
    emit(ActionLoadingState());
    ApiResult<Message> response = await _markMediaUsecase.call(MediaParams(
        mediaId: media.id,
        mediaType: mediaType,
        mark: fav,
        markType: 'favorite'));

    switch (response) {
      case ApiSuccess<Message>():
        emit(ActionSuccessState());
      case ApiFailure<Message>():
        media.mediaAccountDetails!.favorite =
            !media.mediaAccountDetails!.favorite;
        emit(ActionErrorState(where: "fav"));
    }
  }

  Future<void> addMediaToWatchList(emit, bool add) async {
    emit(ActionLoadingState());
    ApiResult<Message> response = await _markMediaUsecase.call(MediaParams(
        mediaId: media.id,
        mediaType: mediaType,
        mark: add,
        markType: 'watchlist'));
    switch (response) {
      case ApiSuccess<Message>():
        emit(ActionSuccessState());
      case ApiFailure<Message>():
        media.mediaAccountDetails!.watchlist =
            !media.mediaAccountDetails!.watchlist;
        emit(ActionErrorState(where: "watchList"));
    }
  }
}