import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class RecommendationsMovieStates {}
class RecommendationsMovieInitialState extends RecommendationsMovieStates {}
class GetMovieRecommendationsLoadingState extends RecommendationsMovieStates{}
class GetMovieRecommendationsSuccessState extends RecommendationsMovieStates{
  final List<Movie> recMovies;
  GetMovieRecommendationsSuccessState(this.recMovies);
}
class GetMovieRecommendationsErrorState extends RecommendationsMovieStates{
  final String msg;
  GetMovieRecommendationsErrorState({required this.msg});
}