import 'package:equatable/equatable.dart';
import 'package:mo3tv/core/entities/video.dart';
import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
//ignore: must_be_immutable
class TvShow extends Equatable{
  final bool ?adult;
  final String? backdropPath;
  final List<CreatedBy>? createdBy;
  final List<int> ?episodeRunTime;
  final String? firstAirDate;
  final List<GenreModel> ?genres;
  final List<GenreModel>? keywords;
  final String ?homepage;
  final int ?id;
  final bool ?inProduction;
  final String ?lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final String ?name;
  final dynamic nextEpisodeToAir;
  final List<Network>? networks;
  final int ?numberOfEpisodes;
  final int ?numberOfSeasons;
  final String ?originalLanguage;
  final String ?originalName;
  final String ?overview;
  final double ?popularity;
  final String ?posterPath;
  final List<TvShowSeasonModel> ?seasons;
  final String ?status;
  final String ?tagline;
  final String ?type;
  final dynamic voteAverage;
  final dynamic voteCount;
  MediaAccountDetails? tvShowAccountDetails;
  Video? trailer;
  final List<Video>?videos;
   TvShow(
      {this.adult,
      this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.keywords,
      this.homepage,
      this.id,
      this.inProduction,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.seasons,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.tvShowAccountDetails,
        this.trailer,
        this.videos,
      this.voteCount});
  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    createdBy,
    episodeRunTime,
    firstAirDate,
    genres,
    homepage,
    id,
    inProduction,
    lastEpisodeToAir,
    lastAirDate,
    name,
    nextEpisodeToAir,
    networks,
    numberOfSeasons,
    originalName,
    originalLanguage,
    overview,
    popularity,
    posterPath,
    seasons,
    status,
    tagline,
    type,
    voteAverage,
    voteCount,
    trailer,
    videos,
  ];
}