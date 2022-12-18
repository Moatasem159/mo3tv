class Search{
  bool? adult;
  String ?backdropPath;
  int ?id;
  String? mediaType;
  String ?originalTitle;
  double? popularity;
  String ?posterPath;
  String ?releaseDate;
  dynamic voteAverage;
  dynamic voteCount;
  String? firstAirDate;
  String? name;
  String ?originalName;

  Search(
      {this.adult,
      this.backdropPath,
      this.id,
      this.mediaType,
      this.originalTitle,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.firstAirDate,
      this.name,
      this.originalName});
}