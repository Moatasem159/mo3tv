class Gallery{

  List<ImageEntity>? backdrops;
  List<ImageEntity> ?logos;
  List<ImageEntity> ?posters;

  Gallery({this.backdrops, this.logos, this.posters});
}


class ImageEntity{

  dynamic aspectRatio;
  dynamic height;
  String ? iso6391;
  String ?filePath;
  dynamic voteAverage;
  dynamic voteCount;
  dynamic width;

  ImageEntity(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});
}