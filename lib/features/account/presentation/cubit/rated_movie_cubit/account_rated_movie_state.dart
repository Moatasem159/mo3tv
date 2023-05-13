abstract class AccountRatedMovieStates {}
class AccountRatedMovieInitialState extends AccountRatedMovieStates {}
class GetAccountsRatedMoviesListLoadingState extends AccountRatedMovieStates {}
class GetAccountsRatedMoviesListSuccessState extends AccountRatedMovieStates {}
class GetAccountsRatedMoviesListErrorState extends AccountRatedMovieStates {
  final String msg;
  GetAccountsRatedMoviesListErrorState({required this.msg});
}