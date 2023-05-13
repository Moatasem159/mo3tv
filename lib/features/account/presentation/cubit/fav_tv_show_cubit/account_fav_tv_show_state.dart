abstract class AccountFavTvShowStates {}
class AccountFavTvShowInitialState extends AccountFavTvShowStates {}
class GetAccountsFavoriteTvShowListLoadingState extends AccountFavTvShowStates {}
class GetAccountsFavoriteTvShowListSuccessState extends AccountFavTvShowStates {}
class GetAccountsFavoriteTvShowListErrorState extends AccountFavTvShowStates {
  final String msg;
  GetAccountsFavoriteTvShowListErrorState({required this.msg});
}