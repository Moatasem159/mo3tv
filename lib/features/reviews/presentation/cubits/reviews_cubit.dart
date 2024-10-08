import 'package:mo3tv/core/api/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/reviews/domain/usecases/get_media_reviews_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsStates> {
  ReviewsCubit(this._getMediaReviewsUsecase)
      : super(GetMediaReviewsLoadingState());

  static ReviewsCubit get(context) => BlocProvider.of(context);
  final GetMediaReviewsUsecase _getMediaReviewsUsecase;
  late int mediaId;
  late String mediaType;

  Future<void> getMediaReviews() async {
    ApiResult<List<Review>> response = await _getMediaReviewsUsecase(
        MediaParams(mediaType: mediaType, mediaId: mediaId));
    switch (response) {
      case ApiSuccess<List<Review>>():
        emit(GetMediaReviewsSuccessState(response.data));
      case ApiFailure<List<Review>>():
        emit(GetMediaReviewsErrorState(msg: mapFailureToMsg(response.failure)));
    }
  }
}