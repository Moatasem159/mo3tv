import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class RecommendationsTvStates {}
class RecommendationsTvInitialState extends RecommendationsTvStates {}
class GetTvShowRecommendationsLoadingState extends RecommendationsTvStates{}
class GetTvShowRecommendationsSuccessState extends RecommendationsTvStates{
  final List<TvShow> tvShows;
  GetTvShowRecommendationsSuccessState(this.tvShows);
}
class GetTvShowRecommendationsErrorState extends RecommendationsTvStates{
  final String msg;
  GetTvShowRecommendationsErrorState({required this.msg});
}