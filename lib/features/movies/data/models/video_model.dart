// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

import 'package:mo3tv/features/movies/domain/entities/video.dart';

VideoModel videoFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    this.id,
    this.results,
  });

  int ?id;
  List<Result> ?results;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json["id"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result extends Video{
  Result({
    super.iso6391,
    super.iso31661,
    super.name,
    super.key,
    super.site,
    super.size,
    super.type,
    super.official,
    super.publishedAt,
    super.id,
  });



  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"],
    key: json["key"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
    official: json["official"],
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt!.toIso8601String(),
    "id": id,
  };
}


