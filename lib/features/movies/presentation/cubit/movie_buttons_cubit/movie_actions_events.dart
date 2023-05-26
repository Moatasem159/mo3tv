abstract class MovieActionsEvents{}
class RateMovieEvent extends MovieActionsEvents{
  final double rate;
  RateMovieEvent(this.rate);
}
class FavMovieEvent extends MovieActionsEvents{
  final bool fav;
  FavMovieEvent(this.fav);
}
class WatchListMovieEvent extends MovieActionsEvents{
  final bool add;
  WatchListMovieEvent(this.add);
}