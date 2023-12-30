import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
abstract class SeasonStates {}
class SeasonInitialState extends SeasonStates {}
class GetSeasonDetailsLoadingState extends SeasonStates{}
class GetSeasonDetailsSuccessState extends SeasonStates{
  final TvShowSeason season;
  GetSeasonDetailsSuccessState(this.season);
}
class GetSeasonDetailsErrorState extends SeasonStates{}