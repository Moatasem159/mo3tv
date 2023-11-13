import 'package:mo3tv/features/credits/data/models/cast_model.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.airDate,
    required super.episodeNumber,
    required super.id,
    required super.name,
    required super.overview,
    required super.runtime,
    required super.seasonNumber,
    required super.showId,
    required super.stillPath,
    required super.voteAverage,
    required super.voteCount,
    required super.crew,
    required super.guestStars,
  });
  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        airDate: json["air_date"] ?? '',
        episodeNumber: json["episode_number"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        overview: json["overview"] ?? '',
        runtime: json["runtime"] ?? 0,
        seasonNumber: json["season_number"] ?? 0,
        showId: json["show_id"] ?? 0,
        stillPath: json["still_path"] ?? '',
        voteAverage: json["vote_average"] ?? 0,
        voteCount: json["vote_count"] ?? 0,
        crew: json["crew"] == null ? [] : List<CastMemberModel>.from(json["crew"].map((x) => CastMemberModel.fromJson(x))),
        guestStars: json["guest_stars"] == null ? [] : List<CastMemberModel>.from(json["guest_stars"].map((x) => CastMemberModel.fromJson(x))),
      );
}
