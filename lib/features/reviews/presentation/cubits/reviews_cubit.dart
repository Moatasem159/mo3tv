import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/usecases/get_media_reviews_usecase.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_state.dart';
class ReviewsCubit extends Cubit<ReviewsStates> {
  ReviewsCubit(this._getMediaReviewsUsecase) : super(ReviewsInitialState());
  static ReviewsCubit get(context)=>BlocProvider.of(context);
  final GetMediaReviewsUsecase _getMediaReviewsUsecase;
  late int mediaId;
  late String mediaType;
  Future<void> getMediaReviews() async {
    emit(GetMediaReviewsLoadingState());
    Either<Failure, List<Review>> response =
    await _getMediaReviewsUsecase.call(mediaId: mediaId,mediaType: mediaType);
    emit(response.fold(
            (failure) =>
            GetMediaReviewsErrorState(msg: mapFailureToMsg(failure)),
            (mediaReviews) {
          return GetMediaReviewsSuccessState(mediaReviews);
        }));
  }
}
