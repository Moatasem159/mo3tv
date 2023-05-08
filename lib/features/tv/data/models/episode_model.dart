import 'package:mo3tv/features/credits/data/models/cast_model.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
class EpisodeModel extends Episode{
  const EpisodeModel({
    super.airDate,
    super.episodeNumber,
    super.id,
    super.name,
    super.overview,
    super.runtime,
    super.seasonNumber,
    super.showId,
    super.stillPath,
    super.voteAverage,
    super.voteCount,
    super.crew,
    super.guestStars,
  });
  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
    airDate: json["air_date"]??'',
    episodeNumber: json["episode_number"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"]??'',
    runtime: json["runtime"],
    seasonNumber: json["season_number"],
    showId: json["show_id"],
    stillPath: json["still_path"],
    voteAverage: json["vote_average"]??0,
    voteCount: json["vote_count"]??0,
    crew: json["crew"]==null?[]:List<CastMemberModel>.from(json["crew"].map((x) => CastMemberModel.fromJson(x))),
    guestStars:json["guest_stars"]==null?[]: List<CastMemberModel>.from(json["guest_stars"].map((x) => CastMemberModel.fromJson(x))),
  );
}