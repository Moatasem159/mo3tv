import 'dart:convert';
import 'package:mo3tv/features/search/domain/entities/search.dart';
class SearchModel extends Search {
  const SearchModel({
    required super.backdropPath,
    required super.id,
    required super.mediaType,
    required super.posterPath,
    required super.releaseDate,
    required super.name,
    required super.voteAverage,
    required super.originalName
  });
  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        mediaType: json["media_type"] ?? '',
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] ?? '',
        voteAverage: json["vote_average"] ?? 0,
        name: json["name"]??json["title"] ?? '',
        originalName: json["original_name"] ??json["original_title"]??'',
      );
  static SearchModel fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return SearchModel.fromJson(json);
  }
  static String toJsonString(SearchModel searchModel) {
    Map<String, dynamic> json = searchToJson(searchModel);
    return jsonEncode(json);
  }
  static Map<String, dynamic> searchToJson(SearchModel searchModel) => {
        "backdrop_path": searchModel.backdropPath,
        "id": searchModel.id,
        "media_type": searchModel.mediaType,
        "poster_path": searchModel.posterPath,
        "release_date": searchModel.releaseDate,
        "vote_average": searchModel.voteAverage,
        "name": searchModel.name,
        "original_name": searchModel.originalName,
      };
  static String encode(List<SearchModel> search) => json.encode(search
      .map<Map<String, dynamic>>((item) => SearchModel.searchToJson(item))
      .toList());
  static List<SearchModel> decode(String search) =>
      (json.decode(search) as List<dynamic>)
          .map<SearchModel>((item) => SearchModel.fromJson(item))
          .toList();
}
