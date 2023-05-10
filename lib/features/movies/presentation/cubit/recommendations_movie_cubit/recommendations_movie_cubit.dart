import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/map_failure_to_string.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_state.dart';
class RecommendationsMovieCubit extends Cubit<RecommendationsMovieStates> {
  RecommendationsMovieCubit(this._getMovieRecommendationsUseCase) : super(RecommendationsMovieInitialState());
  static RecommendationsMovieCubit get(context)=>BlocProvider.of(context);
  final GetMovieRecommendationsUseCase _getMovieRecommendationsUseCase;
  Future<void> getMovieRecommendations({required  movieId}) async {
    emit(GetMovieRecommendationsLoadingState());
    Either<Failure, List<Movie>> response =
    await _getMovieRecommendationsUseCase.call(movieId: movieId);
    List<Movie> movieRecommendations=[];
    emit(response.fold((failure) => GetMovieRecommendationsErrorState(msg: mapFailureToMsg(failure)),
            (recommendations) {
          for (var element in recommendations) {
            if(element.posterPath!=''&&element.backdropPath!="")
            {
              movieRecommendations.add(element);
            }
          }
          return GetMovieRecommendationsSuccessState(movieRecommendations);
        }));
  }
  bool isInitial(){
    return state is RecommendationsMovieInitialState;
  }
}