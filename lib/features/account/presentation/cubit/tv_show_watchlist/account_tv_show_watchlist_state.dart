abstract class AccountTvShowWatchlistStates {}
class AccountTvShowWatchlistInitialState extends AccountTvShowWatchlistStates {}
class GetAccountsTvShowWatchlistLoadingState extends AccountTvShowWatchlistStates {}
class GetAccountsTvShowWatchlistSuccessState extends AccountTvShowWatchlistStates {}
class GetAccountsTvShowWatchlistErrorState extends AccountTvShowWatchlistStates {
  final String msg;
  GetAccountsTvShowWatchlistErrorState({required this.msg});
}
class UpdateState extends AccountTvShowWatchlistStates {}