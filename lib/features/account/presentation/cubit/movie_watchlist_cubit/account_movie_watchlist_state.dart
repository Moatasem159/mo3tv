abstract class AccountMovieWatchlistStates {}
class MovieWatchlistInitialState extends AccountMovieWatchlistStates {}
class GetAccountsMovieWatchlistLoadingState extends AccountMovieWatchlistStates {}
class GetAccountsMovieWatchlistSuccessState extends AccountMovieWatchlistStates {}
class GetAccountsMovieWatchlistErrorState extends AccountMovieWatchlistStates {
  final String msg;
  GetAccountsMovieWatchlistErrorState({required this.msg});
}
class UpdateState extends AccountMovieWatchlistStates {}