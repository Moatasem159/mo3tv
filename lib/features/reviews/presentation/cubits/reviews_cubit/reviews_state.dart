import 'package:mo3tv/features/reviews/domain/entities/review.dart';
abstract class ReviewsStates {}
class ReviewsInitialState extends ReviewsStates{}
class GetMediaReviewsLoadingState extends ReviewsStates{}
class GetMediaReviewsSuccessState extends ReviewsStates{
  final List<Review> reviews;
  GetMediaReviewsSuccessState(this.reviews);
}
class GetMediaReviewsErrorState extends ReviewsStates{
  final String msg;
  GetMediaReviewsErrorState({required this.msg});
}