import 'package:equatable/equatable.dart';
import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
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
  final List<String>? languages;
  final String ?lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final String ?name;
  final dynamic nextEpisodeToAir;
  final List<Network>? networks;
  final int ?numberOfEpisodes;
  final int ?numberOfSeasons;
  final List<String>? originCountry;
  final String ?originalLanguage;
  final String ?originalName;
  final String ?overview;
  final double ?popularity;
  final String ?posterPath;
  final List<Network>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final List<Season> ?seasons;
  final List<SpokenLanguage>? spokenLanguages;
  final String ?status;
  final String ?tagline;
  final String ?type;
  final dynamic voteAverage;
  final dynamic voteCount;
  MediaAccountDetails? tvShowAccountDetails;
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
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.tvShowAccountDetails,
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
    originCountry,
    originalName,
    originalLanguage,
    overview,
    popularity,
    posterPath,
    productionCompanies,
    seasons,
    spokenLanguages,
    status,
    tagline,
    type,
    voteAverage,
    voteCount,
  ];
}






class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  String ?iso31661;
  String ?name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name,
  };
}



class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String ?englishName;
  String ?iso6391;
  String ?name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": iso6391,
    "name": name,
  };
}