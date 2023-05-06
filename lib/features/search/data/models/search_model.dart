import 'package:mo3tv/features/search/domain/entities/search.dart';
class SearchModel extends Search{
  SearchModel(
      {super.adult,
        super.backdropPath,
        super.id,
        super.mediaType,
        super.originalTitle,
        super.popularity,
        super.posterPath,
        super.releaseDate,
        super.voteAverage,
        super.voteCount,
        super.firstAirDate,
        super.name,
        super.originalName});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        mediaType: json["media_type"] ?? '',
        originalTitle: json["original_title"] ?? '',
        popularity: json["popularity"] ?? 0,
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] ?? '',
        voteAverage: json["vote_average"] ?? 0,
        voteCount: json["vote_count"] ?? 0,
        firstAirDate: json["first_air_date"] ?? '',
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
      );
}