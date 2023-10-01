import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class ImageModel extends ImageEntity {
  ImageModel({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
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