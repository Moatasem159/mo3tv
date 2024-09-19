import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';

class GetMediaReviewsUsecase {
  final ReviewsRepository _reviewsRepository;

  const GetMediaReviewsUsecase(this._reviewsRepository);

  Future<ApiResult<List<Review>>> call(MediaParams params) async =>
      await _reviewsRepository.getMediaReviews(params);
}