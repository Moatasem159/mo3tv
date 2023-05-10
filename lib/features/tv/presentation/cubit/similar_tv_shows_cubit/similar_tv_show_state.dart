abstract class SimilarTvShowStates {}
class SimilarTvShowInitialState extends SimilarTvShowStates {}
class GetSimilarTvShowLoadingState extends SimilarTvShowStates{}
class GetSimilarTvShowSuccessState extends SimilarTvShowStates{}
class GetSimilarTvShowErrorState extends SimilarTvShowStates{
  final String msg;
  GetSimilarTvShowErrorState({required this.msg});
}