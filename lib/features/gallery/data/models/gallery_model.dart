import 'package:mo3tv/features/gallery/data/models/image_model.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
class GalleryModel extends Gallery {
  GalleryModel({required super.backdrops, required super.logos, required super.posters});
  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    backdrops: json["backdrops"] == null ? [] : List<ImageModel>.from(
        json["backdrops"].map((x) => ImageModel.fromJson(x))),
    logos: json["logos"] == null
        ? []
        : List<ImageModel>.from(
        json["logos"].map((x) => ImageModel.fromJson(x))),
    posters: json["posters"] == null
        ? []
        : List<ImageModel>.from(
        json["posters"].map((x) => ImageModel.fromJson(x))),
  );
}