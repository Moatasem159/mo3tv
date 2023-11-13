import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
class TvShowSeason extends Equatable {
  final String airDate;
  final int episodeCount;
  final int id;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  const TvShowSeason({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.episodes,
    required this.seasonNumber,
  });
  @override
  List<Object?> get props => [
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
