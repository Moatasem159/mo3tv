

import 'dart:convert';

import 'package:mo3tv/core/entities/video.dart';

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
    super.name,
    super.key,
    super.site,
    super.type,
    super.official,
    super.publishedAt,
    super.id,
  });



  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"]??'',
    key: json["key"]??'',
    site: json["site"]??'',
    type: json["type"]??'',
    official: json["official"]??false,
    publishedAt:json["published_at"]??'',
    id: json["id"]??'',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "key": key,
    "site": site,
    "type": type,
    "official": official,
    "published_at": publishedAt,
    "id": id,
  };
}


