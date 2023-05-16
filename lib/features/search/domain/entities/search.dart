import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Search extends Equatable {
  bool? adult;
  String? backdropPath;
  int? id;
  String? mediaType;
  String? originalTitle;
  dynamic popularity;
  String? posterPath;
  String? releaseDate;
  dynamic voteAverage;
  dynamic voteCount;
  String? firstAirDate;
  String? name;
  String? originalName;

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

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        originalName,
        mediaType,
        originalTitle,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
        name,
        originalName,
        firstAirDate,
      ];
}
