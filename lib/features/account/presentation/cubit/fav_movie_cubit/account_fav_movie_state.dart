abstract class AccountFavMovieStates {}
class AccountFavMovieInitialState extends AccountFavMovieStates {}
class GetAccountsFavoriteMoviesListLoadingState extends AccountFavMovieStates {}
class GetAccountsFavoriteMoviesListSuccessState extends AccountFavMovieStates {}
class GetAccountsFavoriteMoviesListErrorState extends AccountFavMovieStates {
  final String msg;
  GetAccountsFavoriteMoviesListErrorState({required this.msg});
}