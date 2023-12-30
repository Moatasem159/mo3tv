import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/data/models/tv_show_model.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
// ignore: must_be_immutable
class TvShow extends Media{
  final int  numberOfSeasons;
  final int  numberOfEpisodes;
  final String type;
  final String lastAirDate;
  final bool inProduction;
  final dynamic nextEpisodeToAir;
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
    super.releaseDate,
    this.inProduction=false,
    this.lastAirDate='',
    this.lastEpisodeToAir=const LastEpisodeToAir(),
    this.nextEpisodeToAir,
    super.productionCompanies,
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
    releaseDate,
    inProduction,
    lastAirDate,
    lastEpisodeToAir,
    originalName,
    name,
    nextEpisodeToAir,
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
    super.productionCompanies,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
    super.trailer,
    super.videos,
  ];
}