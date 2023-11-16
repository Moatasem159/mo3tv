import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
// ignore: must_be_immutable
class Movie extends Media{
  final num budget;
  final num revenue;
  final num runtime;
  final String releaseDate;
  final List<ProductionCompany> productionCompanies;
  Movie({
    required super.id,
    required super.name,
    required super.posterPath,
    required super.backdropPath,
    required super.originalName,
    this.budget=0,
    this.productionCompanies=const [],
    this.releaseDate='',
    this.revenue=0,
    this.runtime=0,
    super.genres,
    super.keywords,
    super.homepage,
    super.status,
    super.tagline,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
    super.videos,
    super.trailer,
  });
  @override
  List<Object?> get props => [
    budget,
    productionCompanies,
    releaseDate,
    revenue,
    runtime,
    super.originalName,
    super.name,
    super.id,
    super.backdropPath,
    super.genres,
    super.keywords,
    super.homepage,
    super.status,
    super.tagline,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
    super.mediaAccountDetails,
    super.trailer,
    super.videos
  ];
}