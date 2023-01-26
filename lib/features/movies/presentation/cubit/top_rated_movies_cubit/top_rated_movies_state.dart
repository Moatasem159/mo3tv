abstract class TopRatedMoviesStates {}

class TopRatedMoviesInitialState extends TopRatedMoviesStates {}
class GetTopRatedMoviesLoadingState extends TopRatedMoviesStates{}
class GetTopRatedMoviesSuccessState extends TopRatedMoviesStates{}
class GetTopRatedMoviesErrorState extends TopRatedMoviesStates{
  final String msg;
  GetTopRatedMoviesErrorState({required this.msg});
}