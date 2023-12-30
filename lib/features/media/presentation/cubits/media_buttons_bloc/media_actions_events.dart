part of 'media_actions_bloc.dart';
abstract class MediaActionsEvents{}
class RateMediaEvent extends MediaActionsEvents{
  final double rate;
  RateMediaEvent(this.rate);
}
class FavMediaEvent extends MediaActionsEvents{
  final bool fav;
  FavMediaEvent(this.fav);
}
class WatchListMediaEvent extends MediaActionsEvents{
  final bool add;
  WatchListMediaEvent(this.add);
}