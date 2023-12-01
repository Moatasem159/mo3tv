import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';
class GetMediaReviewsUsecase{
  final ReviewsRepository _reviewsRepository;
  const GetMediaReviewsUsecase(this._reviewsRepository);
  Future<Either<Failure, List<Review>>> call({required int mediaId,required String mediaType}) async{
    return await _reviewsRepository.getMediaReviews(mediaId:  mediaId,mediaType: mediaType);
  }
}