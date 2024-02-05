part of'reviews_cubit.dart';
abstract class ReviewsStates {}
class GetMediaReviewsLoadingState extends ReviewsStates{}
class GetMediaReviewsSuccessState extends ReviewsStates{
  final List<Review> reviews;
  GetMediaReviewsSuccessState(this.reviews);
}
class GetMediaReviewsErrorState extends ReviewsStates{
  final String msg;
  GetMediaReviewsErrorState({required this.msg});
}