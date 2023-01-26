
abstract class MoreMoviesStates {}

class MoreMoviesInitialState extends MoreMoviesStates {}
class GetMoreMoviesLoadingState extends MoreMoviesStates{}
class GetMoreMoviesSuccessState extends MoreMoviesStates{}
class GetMoreMoviesErrorState extends MoreMoviesStates{
  final String msg;
  GetMoreMoviesErrorState({required this.msg});
}
