import 'package:mo3tv/features/media/domain/entities/video.dart';
class VideoModel extends Video {
  const VideoModel({
    required super.name,
    required super.key,
    required super.site,
    required super.type,
    required super.official,
    required super.publishedAt,
    required super.id,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        name: json["name"] ?? '',
        key: json["key"] ?? '',
        site: json["site"] ?? '',
        type: json["type"] ?? '',
        official: json["official"] ?? false,
        publishedAt: json["published_at"] ?? '',
        id: json["id"] ?? '',
      );
}
