import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/reviews/data/datasources/reviews_data_source.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';

class ReviewsRepositoryImpl implements ReviewsRepository {
  final BaseRepository _baseRepository;
  final ReviewsDataSource _reviewsDataSource;

  const ReviewsRepositoryImpl(this._baseRepository, this._reviewsDataSource);

  @override
  Future<ApiResult<List<Review>>> getMediaReviews(MediaParams params) async {
    return _baseRepository.execute<List<Review>>(
        () => _reviewsDataSource.getMediaReviews(params));
  }
}