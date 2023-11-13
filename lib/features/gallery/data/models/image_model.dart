import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class ImageModel extends ImageEntity {
  const ImageModel({
    required super.aspectRatio,
    required super.height,
    required super.iso6391,
    required super.filePath,
    required super.voteAverage,
    required super.voteCount,
    required super.width,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        aspectRatio: json["aspect_ratio"] ?? 0,
        height: json["height"] ?? 0,
        iso6391: json["iso_639_1"] ?? '',
        filePath: json["file_path"] ?? '',
        voteAverage: json["vote_average"] ?? 0,
        voteCount: json["vote_count"] ?? 0,
        width: json["width"] ?? 0,
      );
}
