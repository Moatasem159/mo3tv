
import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/movies/data/models/keywords_model.dart';

//ignore: must_be_immutable
class Movie extends Equatable {
  final bool ?adult;
  final String ?backdropPath;
  final dynamic belongsToCollection;
  final dynamic budget;
  final List<GenreModel>? genres;
  final List<GenreModel>? keywords;
  final String ?homepage;
  final int ?id;
  final String? imdbId;
  final String ?originalLanguage;
  final String ?originalTitle;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final List<ProductionCompany> ?productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String?releaseDate;
  final  dynamic revenue;
  final dynamic runtime;
  final List<SpokenLanguage> ?spokenLanguages;
  final String? status;
  final String ?tagline;
  final String? title;
  final bool? video;
  final dynamic voteAverage;
  final dynamic voteCount;
  dynamic rating;
  MovieAccountDetails? movieAccountDetails;

   Movie({
   this.adult,
  this.backdropPath,
  this.belongsToCollection,
   this.budget,
  this.genres,
   this.homepage,
   this.id,
 this.imdbId,
   this.originalLanguage,
  this.originalTitle,
   this.overview,
  this.popularity,
    this.posterPath,
  this.productionCompanies,
   this.productionCountries,
   this.releaseDate,
  this.revenue,
   this.runtime, this.spokenLanguages,
   this.status,
   this.tagline,
 this.title,
  this.video,
   this.voteAverage,
   this.voteCount,
   this.keywords,
    this.rating,
    this.movieAccountDetails,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overview,
        voteAverage,
        releaseDate,
        adult,
       backdropPath,
    belongsToCollection,
    budget,
    genres,
    homepage,
    imdbId,
    originalLanguage,
    originalTitle,
      ];


}


class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  String englishName;
  String iso6391;
  String name;

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

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  String iso31661;
  String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name,
  };
}


class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  int id;
  String logoPath;
  String name;
  String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"],
    logoPath: json["logo_path"]??'',
    name: json["name"]??'',
    originCountry: json["origin_country"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountry,
  };
}


class MovieAccountDetails {
  MovieAccountDetails({
    this.favorite,
    this.rated,
    this.watchlist,
    this.ratedValue
  });

  bool? favorite;
  dynamic rated;
  dynamic ratedValue;
  bool? watchlist;

  factory MovieAccountDetails.fromJson(Map<String, dynamic> json) => MovieAccountDetails(
    favorite: json["favorite"],
    rated: json["rated"]??true,
    ratedValue:json["rated"]==false?0.0:json["rated"]["value"],
    watchlist: json["watchlist"],
  );

  Map<String, dynamic> toJson() => {
    "favorite": favorite,
    "rated": rated,
    "watchlist": watchlist,
  };
}
