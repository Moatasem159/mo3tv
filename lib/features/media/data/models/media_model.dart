import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/data/models/keywords_model.dart';
// ignore: must_be_immutable
class MediaModel extends Media {
  MediaModel({
    required super.name,
    required super.originalName,
    required super.id,
    required super.backdropPath,
    required super.posterPath,
    required super.genres,
    required super.homepage,
    required super.keywords,
    required super.originalLanguage,
    required super.overview,
    required super.popularity,
    required super.releaseDate,
    required super.status,
    required super.tagline,
    required super.voteCount,
    required super.voteAverage,
  });
  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
    id: json["id"],
    name: json["title"]??json["name"]??'',
    backdropPath: json["backdrop_path"]??'',
    homepage: json["homepage"]??'',
    originalLanguage: json["original_language"]??'',
    originalName: json["original_title"]??json["original_name"]??'',
    overview: json["overview"]??'',
    popularity: json["popularity"]??0,
    posterPath: json["poster_path"]??'',
    releaseDate:json["release_date"]??'',
    status: json["status"]??'',
    tagline: json["tagline"]??'',
    voteAverage: json["vote_average"]??0,
    voteCount: json["vote_count"]??0,
    genres: json["genres"]==null?[]:List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
    keywords:json["keywords"]==null?[]:List<GenreModel>.from(json["keywords"]['keywords'].map((x) => GenreModel.fromJson(x))),
  );
  static Map<String, dynamic> mediaToJson(MediaModel mediaModel) => {
    "backdrop_path":mediaModel.backdropPath,
    "poster_path":mediaModel.posterPath,
    'id':mediaModel.id,
    "original_title":mediaModel.originalName,
    "title":mediaModel.name,
    "vote_average":mediaModel.voteAverage,
    "vote_count":mediaModel.voteCount,
    "popularity":mediaModel.popularity,
    "release_date":mediaModel.releaseDate};
  static Map<String, dynamic> mediaListToMap(List<MediaModel> media) {
    Map<String, dynamic> result = {};
    for (MediaModel element in media) {
      result[element.id.toString()] = MediaModel.mediaToJson(element);
    }
    return result;
  }
  static List<MediaModel> mapToList(Map<String, dynamic> mediaMap) {
    List<MediaModel> media = [];
    mediaMap.forEach((key, value) {
      media.add(MediaModel.fromJson(value));
    });
    return media;
  }
}
