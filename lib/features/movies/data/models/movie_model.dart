import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/core/models/video_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
//ignore: must_be_immutable
class MovieModel extends Movie {
   MovieModel(
      {super.adult,
      super.backdropPath,
      super.budget,
       super.genres,
       super.keywords,
      super.homepage,
      super.id,
       super.imdbId,
       super.originalLanguage,
       super.originalTitle,
       super.overview,
       super.popularity,
       super.posterPath,
       super.productionCompanies,
       super.releaseDate,
       super.revenue,
       super.runtime,
       super.status,
       super.tagline,
       super.title,
       super.voteAverage,
       super.voteCount,
       super.belongsToCollection,
       super.movieAccountDetails,
        super.trailer,
        super.videos
      });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"]??'',
      belongsToCollection: json["belongs_to_collection"]??'',
      budget: json["budget"]??0,
      genres: json["genres"]==null?[]:List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
      keywords:json["keywords"]==null?[]:List<GenreModel>.from(json["keywords"]['keywords'].map((x) => GenreModel.fromJson(x))),
      homepage: json["homepage"]??'',
      id: json["id"],
      imdbId: json["imdb_id"]??"",
      originalLanguage: json["original_language"]??'',
      originalTitle: json["original_title"]??'',
      overview: json["overview"]??'',
      popularity: json["popularity"]??0,
      posterPath: json["poster_path"]??'',
      productionCompanies:json["production_companies"]==null?[]:List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
      releaseDate:json["release_date"]??'',
      movieAccountDetails:json["account_states"]==null?MediaAccountDetails():MediaAccountDetails.fromJson(json["account_states"]),
      revenue: json["revenue"]??0,
      runtime: json["runtime"]??0,
      status: json["status"]??'',
      tagline: json["tagline"]??'',
      title: json["title"]??'',
      voteAverage: json["vote_average"]??0,
      voteCount: json["vote_count"]??0,
     videos: json["videos"]==null?[]:List<Result>.from(json["videos"]["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "adult": adult,
      "backdrop_path": backdropPath,
      "belongs_to_collection": belongsToCollection,
      "budget": budget,
      "genres": List<GenreModel>.from(genres!.map((x) => x.toJson())),
      "homepage": homepage,
      "id": id,
      "imdb_id": imdbId,
      "original_language": originalLanguage,
      "original_title": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
      "release_date": releaseDate,
      "revenue": revenue,
      "runtime": runtime,
      "status": status,
      "tagline": tagline,
      "title": title,
      "vote_average": voteAverage,
      "vote_count": voteCount,
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