import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/core/models/network_model.dart';
import 'package:mo3tv/features/video/data/video_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
//ignore: must_be_immutable
class TvShowModel extends TvShow {
  TvShowModel({
    required super.backdropPath,
    required super.createdBy,
    required super.episodeRunTime,
    required super.releaseDate,
    required super.genres,
    required super.keywords,
    required super.homepage,
    required super.id,
    required super.inProduction,
    required super.lastAirDate,
    required super.lastEpisodeToAir,
    required super.name,
    required super.nextEpisodeToAir,
    required super.productionCompanies,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.seasons,
    required super.status,
    required super.tagline,
    required super.type,
    required super.voteAverage,
    required super.voteCount,
    required super.mediaAccountDetails,
    required super.videos,
  });
  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
    backdropPath: json["backdrop_path"]??'',
    releaseDate: json["first_air_date"]??'',
    homepage: json["homepage"]??'',
    id: json["id"],
    inProduction: json["in_production"]??false,
    lastAirDate: json["last_air_date"]??'',
    name: json["name"]??'',
    nextEpisodeToAir: json["next_episode_to_air"]??0,
    numberOfEpisodes: json["number_of_episodes"]??0,
    numberOfSeasons: json["number_of_seasons"]??0,
    originalLanguage: json["original_language"]??'',
    originalName: json["original_name"]??'',
    overview: json["overview"]??'',
    popularity: json["popularity"]==null?0:json["popularity"].toDouble(),
    posterPath: json["poster_path"]??'',
    status: json["status"]??'',
    tagline: json["tagline"]??'',
    type: json["type"]??'',
    voteAverage: json["vote_average"]==null?0: json["vote_average"].toDouble(),
    voteCount: json["vote_count"]??0,
    mediaAccountDetails:json["account_states"]==null?MediaAccountDetails():MediaAccountDetails.fromJson(json["account_states"]),
    lastEpisodeToAir:json["last_episode_to_air"]==null?const LastEpisodeToAir():LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
    genres: json["genres"]==null?[]:List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
    productionCompanies:json["networks"]==null?[]: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
    keywords:json["keywords"]==null?[]:List<GenreModel>.from(json["keywords"]['results'].map((x) => GenreModel.fromJson(x))),
    createdBy:json["created_by"]==null?[]:List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
    episodeRunTime:json["episode_run_time"]==null?[]:List<int>.from(json["episode_run_time"].map((x) => x)),
    seasons:json["seasons"]==null?[]:List<TvShowSeasonModel>.from(json["seasons"].map((x) => TvShowSeasonModel.fromJson(x))),
    videos: json["videos"]==null?[]:List<VideoModel>.from(json["videos"]["results"].map((x) => VideoModel.fromJson(x))),
  );
   static Map<String, dynamic> tvShowToJson(TvShowModel tvShowModel) => {
     "backdrop_path":tvShowModel.backdropPath,
     "poster_path":tvShowModel.posterPath,
     'id':tvShowModel.id,
     "original_name":tvShowModel.originalName,
     "name":tvShowModel.name,
     "vote_average":tvShowModel.voteAverage,
     "vote_count":tvShowModel.voteCount,
     "popularity":tvShowModel.popularity,
     "last_air_date":tvShowModel.lastAirDate,
     "first_air_date":tvShowModel.releaseDate,
   };
   static Map<String, dynamic> tvShowsListToMap(List<TvShowModel> tvShows) {
     final Map<String, dynamic> tvShowMap = {};
     for (var tvShow in tvShows) {
       tvShowMap[tvShow.id.toString()] = TvShowModel.tvShowToJson(tvShow);
     }
     return tvShowMap;
   }
   static List<TvShowModel> mapToList(Map<String, dynamic> tvShowMap) {
    final List<TvShowModel> tvShows = [];
    tvShowMap.forEach((key, value) {
      tvShows.add(TvShowModel.fromJson(value));
    });
    return tvShows;
  }
}
class CreatedBy {
  final int ?id;
  final String? creditId;
  final String ?name;
  final int ?gender;
  final String? profilePath;
  const CreatedBy({this.id,this.creditId,this.name,this.gender,this.profilePath});
  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"]??0,
    creditId: json["credit_id"]??0,
    name: json["name"]??'',
    gender: json["gender"]??0,
    profilePath: json["profile_path"]??'',
  );
}

class LastEpisodeToAir {
  final int? id;
  final int ?episodeNumber;
  final String ?airDate;
  final String ?name;
  final String ?overview;
  final String ?productionCode;
  final int ?runtime;
  final int ?seasonNumber;
  final int ?showId;
  final String ?stillPath;
  final dynamic voteAverage;
  final dynamic voteCount;
  const LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => LastEpisodeToAir(
    airDate: json["air_date"]??'',
    episodeNumber: json["episode_number"]??0,
    id: json["id"],
    name: json["name"]??'',
    overview: json["overview"]??'',
    productionCode: json["production_code"]??'',
    runtime: json["runtime"]??0,
    seasonNumber: json["season_number"]??0,
    showId: json["show_id"]??0,
    stillPath: json["still_path"]??'',
    voteAverage: json["vote_average"]??0,
    voteCount: json["vote_count"]??0,
  );
}