import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_recommendations_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_state.dart';
class RecommendationsTvCubit extends Cubit<RecommendationsTvStates> {
  RecommendationsTvCubit(this._getTvRecommendationsUseCase) : super(RecommendationsTvInitialState());
  final GetTvRecommendationsUseCase _getTvRecommendationsUseCase;
  static RecommendationsTvCubit get(context)=>BlocProvider.of(context);
  Future<void> getTvShowsRecommendations({required int tvId})async{
    emit(GetTvShowRecommendationsLoadingState());
    Either<Failure, List<TvShow>> response =
    await _getTvRecommendationsUseCase.call(tvId: tvId,lang: AppStrings.appLang);
    emit(response.fold(
        (failure) => GetTvShowRecommendationsErrorState(msg: mapFailureToMsg(failure)),
        (recommendations) => GetTvShowRecommendationsSuccessState(recommendations)));
  }
}