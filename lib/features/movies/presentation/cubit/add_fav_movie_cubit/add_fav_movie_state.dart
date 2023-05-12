abstract class AddFavMovieStates {}
class AddFavMovieInitialState extends AddFavMovieStates {}
class FavMovieLoadingState extends AddFavMovieStates{}
class FavMovieSuccessState extends AddFavMovieStates{
  final int statusCode;
  FavMovieSuccessState({required this.statusCode});
}
class FavMovieErrorState extends AddFavMovieStates{
  final String msg;
  FavMovieErrorState({required this.msg});
}