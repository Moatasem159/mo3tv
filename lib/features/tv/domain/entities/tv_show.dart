import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
// ignore: must_be_immutable
class TvShow extends Media{
  final int  numberOfSeasons;
  final int  numberOfEpisodes;
  final String type;
  final String lastAirDate;
  final String firstAirDate;
  final bool inProduction;
  final dynamic nextEpisodeToAir;
  final List<Network>  networks;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final LastEpisodeToAir  lastEpisodeToAir;
  final List<TvShowSeason>  seasons;
  TvShow({
    required super.id,
    required super.backdropPath,
    required super.posterPath,
    required super.name,
    required super.originalName,
    this.createdBy=const [],
    this.episodeRunTime=const [],
    this.firstAirDate='',
    this.inProduction=false,
    this.lastAirDate='',
    this.lastEpisodeToAir=const LastEpisodeToAir(),
    this.nextEpisodeToAir,
    this.networks= const [],
    this.numberOfEpisodes=0,
    this.numberOfSeasons=0,
    this.seasons=const [],
    this.type='',
    super.genres,
    super.keywords,
    super.homepage,
    super.status,
    super.tagline,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
    super.trailer,
    super.videos,
  });
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