import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/reviews/data/models/review_model.dart';
abstract class ReviewsDataSource{
  Future<List<ReviewModel>> getMediaReviews(MediaParams params);
}
class ReviewsDataSourceImpl implements ReviewsDataSource {
  final ApiConsumer _apiConsumer;
  const ReviewsDataSourceImpl(this._apiConsumer);
  @override
  Future<List<ReviewModel>> getMediaReviews(MediaParams params) async {
    final response = await _apiConsumer.get(EndPoints.mediaReviewsPath(params));
    return List<ReviewModel>.from((response['results'] as List).map((x) => ReviewModel.fromJson(x)));
  }
}