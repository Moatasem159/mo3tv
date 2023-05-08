import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
class Episode extends Equatable{
  final String? airDate;
  final int ?episodeNumber;
  final int?id;
  final String? name;
  final String? overview;
  final int ?runtime;
  final int ?seasonNumber;
  final int? showId;
  final String ?stillPath;
  final dynamic voteAverage;
  final dynamic voteCount;
  final List<CastMember>?crew;
  final List<CastMember>? guestStars;

  const Episode(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.runtime,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount,
      this.crew,
      this.guestStars});
  @override
  List<Object?> get props =>[
    airDate,
        episodeNumber,
        id,
        name,
        overview,
        runtime,
        seasonNumber,
        showId,
        stillPath,
        voteAverage,
        voteCount,
        crew,
        guestStars,
      ];
}