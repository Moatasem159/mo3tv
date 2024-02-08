import 'package:equatable/equatable.dart';
class Search extends Equatable {
  final int id;
  final String name;
  final String originalName;
  final String backdropPath;
  final String posterPath;
  final String mediaType;
  final String releaseDate;
  final num voteAverage;
  const Search({
    required this.backdropPath,
    required this.id,
    required this.mediaType,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.name,
    required this.originalName,
  });
  @override
  List<Object?> get props => [
        backdropPath,
        id,
        originalName,
        mediaType,
        posterPath,
        voteAverage,
        name,
        originalName,
      ];
}
