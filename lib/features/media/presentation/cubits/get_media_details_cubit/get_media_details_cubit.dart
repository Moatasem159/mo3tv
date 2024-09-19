import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';

part 'get_media_details_states.dart';

class GetMediaDetailsCubit extends Cubit<GetMediaDetailsStates> {
  GetMediaDetailsCubit(
      this._getMovieDetailsUseCase, this._getTvShowDetailsUsecase, this.params)
      : super(GetMediaDetailsInitialState());
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  final MediaParams params;
  late final Movie movie;
  late final TvShow tvShow;

  static GetMediaDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> getMovieDetailsData() async {
    emit(GetMediaDetailsLoadingState());
    ApiResult<dynamic> response;
    if (params.mediaType == AppStrings.movie) {
      response = await _getMovieDetails();
    } else {
      response = await _getTvShowDetails();
    }
    switch (response) {
      case ApiSuccess():
        for (var element in response.data.videos) {
          if (element.name == "Official Trailer") {
            response.data.trailer = element;
            break;
          } else if (element.name == "Official Teaser") {
            response.data.trailer = element;
            break;
          } else if (element.type == "Trailer") {
            response.data.trailer = element;
            break;
          }
        }
        response.data.videos.clear();
        if (params.mediaType == AppStrings.movie) {
          movie = response.data;
        } else {
          tvShow = response.data;
        }
        emit(GetMediaDetailsSuccessState());
      case ApiFailure():
        emit(GetMediaDetailsErrorState(msg: mapFailureToMsg(response.failure)));
    }
  }

  Future<ApiResult<Movie>> _getMovieDetails() async {
    return await _getMovieDetailsUseCase.call(MediaParams(
        mediaId: params.mediaId,
        mediaType: params.mediaType,
        lang: AppStrings.appLang));
  }

  Future<ApiResult<TvShow>> _getTvShowDetails() async {
    return await _getTvShowDetailsUsecase.call(MediaParams(
        mediaId: params.mediaId,
        mediaType: params.mediaType,
        lang: AppStrings.appLang));
  }
}