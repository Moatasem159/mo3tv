import 'package:equatable/equatable.dart';
// ignore: must_be_immutable
class Search extends Equatable {
  final int id;
  String? name;
  String? originalName;
  String? backdropPath;
  dynamic popularity;
  String? posterPath;
  dynamic voteAverage;
  dynamic voteCount;
  String? releaseDate;
  String? firstAirDate;
  String? mediaType;
  String? originalTitle;
  Search(
      {
      this.backdropPath,
      required this.id,
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

