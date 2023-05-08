import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
abstract class ReviewsRepository{
  Future<Either<Failure,List<Review>>> getMediaReviews({required int mediaId,required String mediaType});
}