import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
// ignore: must_be_immutable
class TvShow extends Media{
  final List<CreatedBy>? createdBy;
  final List<int> ?episodeRunTime;
  final String? firstAirDate;
  final bool ?inProduction;
  final String ?lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final dynamic nextEpisodeToAir;
  final List<Network>? networks;
  final int ?numberOfEpisodes;
  final int ?numberOfSeasons;
  final List<TvShowSeason> ?seasons;
  final String ?type;
  TvShow(
      {this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.inProduction,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.seasons,
      this.type,
      required super.id,
      super.backdropPath,
      super.genres,
      super.keywords,
      super.homepage,
      super.status,
      super.tagline,
      super.originalLanguage,
      super.overview,
      super.popularity,
      super.posterPath,
      super.voteAverage,
      super.voteCount,
      super.mediaAccountDetails,
      super.trailer,
      super.videos,
      super.name,
      super.originalName});
  @override
  List<Object?> get props => [
    createdBy,
    episodeRunTime,
    firstAirDate,
    inProduction,
    lastAirDate,
    lastEpisodeToAir,
    originalName,
    name,
    nextEpisodeToAir,
    networks,
    numberOfEpisodes,
    numberOfSeasons,
    seasons,
    type,
    super.id,
    super.backdropPath,
    super.genres,
    super.keywords,
    super.homepage,
    super.status,
    super.tagline,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
    super.trailer,
    super.videos,
  ];
}