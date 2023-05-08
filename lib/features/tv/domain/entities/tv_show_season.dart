import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
class TvShowSeason extends Equatable{
  final String? airDate;
  final int ?episodeCount;
  final int ?id;
  final List<Episode>? episodes;
  final String ?name;
  final String ?overview;
  final String ?posterPath;
  final int ?seasonNumber;
  const TvShowSeason(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.episodes,
      this.seasonNumber});
  @override
  List<Object?> get props =>[
    airDate,
    episodeCount,
    id,
    episodes,
    name,
    overview,
    posterPath,
    seasonNumber,
  ];
}