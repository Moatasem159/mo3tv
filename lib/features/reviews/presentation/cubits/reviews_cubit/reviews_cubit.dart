import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/usecases/get_media_reviews_usecase.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_state.dart';
class ReviewsCubit extends Cubit<ReviewsStates> {
  ReviewsCubit(this._getMediaReviewsUsecase) : super(ReviewsInitialState());
  static ReviewsCubit get(context)=>BlocProvider.of(context);
  final GetMediaReviewsUsecase _getMediaReviewsUsecase;
  int ?mediaId;
  String ?mediaType;
  Future<void> getMovieReviews({required int mediaId,required String mediaType}) async {
    this.mediaId=mediaId;
    this.mediaType=mediaType;
    emit(GetMediaReviewsLoadingState());
    Either<Failure, List<Review>> response =
    await _getMediaReviewsUsecase.call(mediaId: mediaId,mediaType: mediaType);
    emit(response.fold(
            (failure) =>
            GetMediaReviewsErrorState(msg: mapFailureToMsg(failure)),
            (movieReviews) {
          // this.movieReviews = movieReviews;
          return GetMediaReviewsSuccessState(movieReviews);
        }));
  }
  initial(){
    emit(ReviewsInitialState());
  }
  bool isInitial(){
    return state is ReviewsInitialState;
  }
}
