import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_state.dart';
class RecommendationsMovieCubit extends Cubit<RecommendationsMovieStates> {
  RecommendationsMovieCubit(this._getMovieRecommendationsUseCase) : super(RecommendationsMovieInitialState());
  static RecommendationsMovieCubit get(context)=>BlocProvider.of(context);
  final GetMovieRecommendationsUseCase _getMovieRecommendationsUseCase;
  Future<void> getMovieRecommendations({required int movieId}) async {
    emit(GetMovieRecommendationsLoadingState());
    Either<Failure, List<Movie>> response =
    await _getMovieRecommendationsUseCase.call(movieId: movieId,lang: AppStrings.appLang);
    emit(response.fold(
        (failure) => GetMovieRecommendationsErrorState(msg: mapFailureToMsg(failure)),
        (recommendations) =>GetMovieRecommendationsSuccessState(recommendations)));
  }
}