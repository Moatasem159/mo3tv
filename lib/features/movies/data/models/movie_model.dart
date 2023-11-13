import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/video/data/video_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
//ignore: must_be_immutable
class MovieModel extends Movie {
   MovieModel({
     super.backdropPath,
     super.budget,
     super.genres,
     super.keywords,
     super.homepage,
     required super.id,
     super.originalLanguage,
     super.originalName,
     super.overview,
     super.popularity,
     super.posterPath,
     super.productionCompanies,
     super.releaseDate,
     super.revenue,
     super.runtime,
     super.status,
     super.tagline,
     super.name,
     super.voteAverage,
     super.voteCount,
     super.mediaAccountDetails,
     super.trailer,
     super.videos
   });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      backdropPath: json["backdrop_path"]??'',
      budget: json["budget"]??0,
      genres: json["genres"]==null?[]:List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
      keywords:json["keywords"]==null?[]:List<GenreModel>.from(json["keywords"]['keywords'].map((x) => GenreModel.fromJson(x))),
      homepage: json["homepage"]??'',
      id: json["id"],
      originalLanguage: json["original_language"]??'',
      originalName: json["original_title"]??'',
      overview: json["overview"]??'',
      popularity: json["popularity"]??0,
      posterPath: json["poster_path"]??'',
      productionCompanies:json["production_companies"]==null?[]:List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
      releaseDate:json["release_date"]??'',
      mediaAccountDetails:json["account_states"]==null?MediaAccountDetails():MediaAccountDetails.fromJson(json["account_states"]),
      revenue: json["revenue"]??0,
      runtime: json["runtime"]??0,
      status: json["status"]??'',
      tagline: json["tagline"]??'',
      name: json["title"]??'',
      voteAverage: json["vote_average"]??0,
      voteCount: json["vote_count"]??0,
      videos: json["videos"]==null?[]:List<VideoModel>.from(json["videos"]["results"].map((x) => VideoModel.fromJson(x))),
  );
   static Map<String, dynamic> movieToJson(MovieModel movieModel) => {
     "backdrop_path":movieModel.backdropPath,
     "poster_path":movieModel.posterPath,
     'id':movieModel.id,
     "original_title":movieModel.originalName,
     "title":movieModel.name,
     "vote_average":movieModel.voteAverage,
     "vote_count":movieModel.voteCount,
     "popularity":movieModel.popularity,
     "release_date":movieModel.releaseDate};
   static Map<String, dynamic> moviesListToMap(List<MovieModel> movies) {
     Map<String, dynamic> result = {};
     for (MovieModel movie in movies) {
       result[movie.id.toString()] = MovieModel.movieToJson(movie);
     }
     return result;
   }
   static List<MovieModel> mapToList(Map<String, dynamic> movieMap) {
     List<MovieModel> movies = [];
     movieMap.forEach((key, value) {
       movies.add(MovieModel.fromJson(value));
     });
     return movies;
   }
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
}