import 'package:equatable/equatable.dart';
class Search extends Equatable {
  final int id;
  final String name;
  final String originalName;
  final String backdropPath;
  final dynamic popularity;
  final String posterPath;
  final dynamic voteAverage;
  final dynamic voteCount;
  final String releaseDate;
  final String firstAirDate;
  final String mediaType;
  final String originalTitle;
  const Search({
    required this.backdropPath,
    required this.id,
    required this.mediaType,
    required this.originalTitle,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
    required this.name,
    required this.originalName,
  });
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
