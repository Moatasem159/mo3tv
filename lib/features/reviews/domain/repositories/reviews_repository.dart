import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';

abstract class ReviewsRepository {
  Future<ApiResult<List<Review>>> getMediaReviews(MediaParams params);
}