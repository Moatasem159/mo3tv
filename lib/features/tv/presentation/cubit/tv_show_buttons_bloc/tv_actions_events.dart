abstract class TvActionsEvents{}
class RateTvShowEvent extends TvActionsEvents{
  final double rate;
  RateTvShowEvent(this.rate);
}
class FavTvShowEvent extends TvActionsEvents{
  final bool fav;
  FavTvShowEvent(this.fav);
}
class WatchListTvShowEvent extends TvActionsEvents{
  final bool add;
  WatchListTvShowEvent(this.add);
}
