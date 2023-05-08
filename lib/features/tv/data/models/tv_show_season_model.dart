import 'package:mo3tv/features/tv/data/models/episode_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
class TvShowSeasonModel extends TvShowSeason{
  const TvShowSeasonModel({
    super.airDate,
    super.episodeCount,
    super.id,
    super.name,
    super.overview,
    super.posterPath,
    super.seasonNumber,
    super.episodes,
  });
  factory TvShowSeasonModel.fromJson(Map<String, dynamic> json) => TvShowSeasonModel(
    airDate: json["air_date"]??'',
    episodeCount: json["episode_count"]??0,
    id: json["id"],
    name: json["name"]??'',
    overview: json["overview"]??'',
    posterPath: json["poster_path"]??'',
    seasonNumber: json["season_number"]??0,
    episodes: json["episodes"]==null?[]:List<EpisodeModel>.from(json["episodes"].map((x) => EpisodeModel.fromJson(x))),
  );
}