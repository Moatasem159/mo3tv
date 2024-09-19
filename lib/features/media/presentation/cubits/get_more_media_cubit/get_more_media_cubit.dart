import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/usecases/get_discover_media_list.dart';
import 'package:mo3tv/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/get_similar_media_usecase.dart';

part 'get_more_media_states.dart';

class GetMoreMediaCubit extends Cubit<GetMoreMediaStates> {
  GetMoreMediaCubit(
      this._getMediaListUsecase,
      this._getDiscoverMediaListUsecase,
      this._getSimilarMediaListUsecase,
      this._params)
      : super(GetMoreMediaInitialState()) {
    page = 1;
    mediaList = [];
  }

  final GetMediaListUsecase _getMediaListUsecase;
  final GetSimilarMediaListUsecase _getSimilarMediaListUsecase;
  final GetDiscoverMediaListUsecase _getDiscoverMediaListUsecase;
  final MediaParams _params;

  static GetMoreMediaCubit get(context) => BlocProvider.of(context);
  late List<Media> mediaList;
  late int page;

  getMoreMedia() async {
    emit(GetMoreMediaLoadingState());
    ApiResult<List<Media>> response;
    if (_params.moreType == AppStrings.recommendations) {
      response = await _getMediaRecommendation();
    } else if (_params.moreType == AppStrings.similar) {
      response = await _getSimilarMovies();
    } else {
      response = await _getMoreMedia();
    }
    switch (response) {
      case ApiSuccess<List<Media>>():
        if (response.data.isEmpty) {
          emit(GetMoreMediaSuccessState(true));
        } else {
          mediaList.addAll(response.data);
          mediaList = mediaList.toSet().toList();
          emit(GetMoreMediaSuccessState(false));
        }
      case ApiFailure<List<Media>>():
        emit(GetMoreMediaErrorState());
    }
  }

  Future<ApiResult<List<Media>>> _getMoreMedia() async {
    page++;
    MediaParams params = MediaParams(
        lang: AppStrings.appLang,
        page: page,
        mediaType: _params.mediaType,
        listType: _params.listType);
    return params.listType == AppStrings.discover
        ? await _getDiscoverMediaListUsecase(params)
        : await _getMediaListUsecase(params);
  }

  Future<ApiResult<List<Media>>> _getMediaRecommendation() async {
    return await _getSimilarMediaListUsecase(MediaParams(
        lang: AppStrings.appLang,
        mediaId: _params.mediaId,
        page: 1,
        mediaType: _params.mediaType,
        listType: _params.listType,
        moreType: _params.moreType));
  }

  Future<ApiResult<List<Media>>> _getSimilarMovies() async {
    page++;
    return await _getSimilarMediaListUsecase(MediaParams(
        lang: AppStrings.appLang,
        mediaId: _params.mediaId,
        page: page,
        mediaType: _params.mediaType,
        listType: _params.listType,
        moreType: _params.moreType));
  }
}