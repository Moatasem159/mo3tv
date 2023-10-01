import 'dart:convert';

import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/core/models/video_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

//ignore: must_be_immutable
class TvShowModel extends TvShow {
   TvShowModel({
    super.backdropPath,
    super.createdBy,
    super.episodeRunTime,
    super.firstAirDate,
    super.genres,
    super.keywords,
    super.homepage,
    required super.id,
    super.inProduction,
    super.lastAirDate,
    super.lastEpisodeToAir,
    super.name,
    super.nextEpisodeToAir,
    super.networks,
    super.numberOfEpisodes,
    super.numberOfSeasons,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.seasons,
    super.status,
    super.tagline,
    super.type,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
   super.videos,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
    backdropPath: json["backdrop_path"]??'',
    createdBy:json["created_by"]==null?[]:List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
    episodeRunTime:json["episode_run_time"]==null?[]:List<int>.from(json["episode_run_time"].map((x) => x)),
    firstAirDate: json["first_air_date"],
    genres: json["genres"]==null?[]:List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
    keywords:json["keywords"]==null?[]:List<GenreModel>.from(json["keywords"]['results'].map((x) => GenreModel.fromJson(x))),
    homepage: json["homepage"]??'',
    mediaAccountDetails:json["account_states"]==null?MediaAccountDetails():MediaAccountDetails.fromJson(json["account_states"]),
    id: json["id"],
    inProduction: json["in_production"],
    lastAirDate: json["last_air_date"]??'',
    lastEpisodeToAir:json["last_episode_to_air"]==null?LastEpisodeToAir():LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
    name: json["name"]??'',
    nextEpisodeToAir: json["next_episode_to_air"]??0,
    networks:json["networks"]==null?[]: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
    numberOfEpisodes: json["number_of_episodes"]??0,
    numberOfSeasons: json["number_of_seasons"]??0,
    originalLanguage: json["original_language"]??'',
    originalName: json["original_name"]??'',
    overview: json["overview"]??'',
    popularity: json["popularity"]==null?0:json["popularity"].toDouble(),
    posterPath: json["poster_path"]??'',
    seasons:json["seasons"]==null?[]:List<TvShowSeasonModel>.from(json["seasons"].map((x) => TvShowSeasonModel.fromJson(x))),
    status: json["status"]??'',
    tagline: json["tagline"]??'',
    type: json["type"]??'',
    voteAverage: json["vote_average"]==null?0: json["vote_average"].toDouble(),
    voteCount: json["vote_count"]??0,
    videos: json["videos"]==null?[]:List<Result>.from(json["videos"]["results"].map((x) => Result.fromJson(x))),
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
     "first_air_date":tvShowModel.firstAirDate
   };
   static String encode(List<TvShowModel> tvShows) =>  json.encode(
       tvShows.map<Map<String, dynamic>>((tvShow) => TvShowModel.tvShowToJson(tvShow)).toList());
   static List<TvShowModel> decode(String tvShows) =>
       (json.decode(tvShows) as List<dynamic>)
           .map<TvShowModel>((tvShow) => TvShowModel.fromJson(tvShow)).toList();
}
class CreatedBy {
  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  int ?id;
  String? creditId;
  String ?name;
  int ?gender;
  String? profilePath;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    creditId: json["credit_id"],
    name: json["name"],
    gender: json["gender"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "credit_id": creditId,
    "name": name,
    "gender": gender,
    "profile_path": profilePath,
  };
}
class Network {
  Network({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  int? id;
  String ?name;
  String ?logoPath;
  String ?originCountry;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],
    name: json["name"],
    logoPath: json["logo_path"] ??'',
    originCountry: json["origin_country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo_path": logoPath ?? '',
    "origin_country": originCountry,
  };
}
class LastEpisodeToAir {
  LastEpisodeToAir({
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

  String ?airDate;
  int ?episodeNumber;
  int? id;
  String ?name;
  String ?overview;
  String ?productionCode;
  int ?runtime;
  int ?seasonNumber;
  int ?showId;
  String ?stillPath;
  dynamic  voteAverage;
  dynamic voteCount;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => LastEpisodeToAir(
    airDate: json["air_date"]??'',
    episodeNumber: json["episode_number"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    productionCode: json["production_code"],
    runtime: json["runtime"],
    seasonNumber: json["season_number"],
    showId: json["show_id"],
    stillPath: json["still_path"],
    voteAverage: json["vote_average"],
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "air_date": airDate,
    "episode_number": episodeNumber,
    "id": id,
    "name": name,
    "overview": overview,
    "production_code": productionCode,
    "runtime": runtime,
    "season_number": seasonNumber,
    "show_id": showId,
    "still_path": stillPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}