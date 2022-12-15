import 'package:mo3tv/core/entities/image.dart';



class GalleryModel extends Gallery{
  GalleryModel({
    super.backdrops,
    super.logos,
    super.posters,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    backdrops: json["backdrops"]==null?[]:List<ImageModel>.from(json["backdrops"].map((x) => ImageModel.fromJson(x))),
    logos: json["logos"]==null?[]:List<ImageModel>.from(json["logos"].map((x) => ImageModel.fromJson(x))),
    posters: json["posters"]==null?[]:List<ImageModel>.from(json["posters"].map((x) => ImageModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": List<ImageModel>.from(backdrops!.map((x) => x)),
    "logos": List<ImageModel>.from(logos!.map((x) => x)),
    "posters": List<ImageModel>.from(posters!.map((x) => x)),
  };

}

class ImageModel extends ImageEntity{

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
    aspectRatio: json["aspect_ratio"]??0,
    height: json["height"]??0,
    iso6391: json["iso_639_1"]??'',
    filePath: json["file_path"]??'',
    voteAverage: json["vote_average"]??0,
    voteCount: json["vote_count"]??0,
    width: json["width"]??0,
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "height": height,
    "iso_639_1": iso6391,
    "file_path": filePath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "width": width,
  };
}




