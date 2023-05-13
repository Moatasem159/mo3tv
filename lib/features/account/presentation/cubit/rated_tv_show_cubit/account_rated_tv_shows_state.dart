abstract class AccountRatedTvShowsStates {}
class AccountRatedTvShowsInitialState extends AccountRatedTvShowsStates {}
class GetAccountsRatedTvShowListLoadingState extends AccountRatedTvShowsStates {}
class GetAccountsRatedTvShowListSuccessState extends AccountRatedTvShowsStates {}
class GetAccountsRatedTvShowListErrorState extends AccountRatedTvShowsStates {
  final String msg;
  GetAccountsRatedTvShowListErrorState({required this.msg});
}
class UpdateState extends AccountRatedTvShowsStates {}