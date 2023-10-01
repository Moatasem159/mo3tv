import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
// ignore: must_be_immutable
class Movie extends Media{
  final num? budget;
  final List<ProductionCompany>? productionCompanies;
  final String? releaseDate;
  final num? revenue;
  final num? runtime;
  Movie(
      {this.budget,
      this.productionCompanies,
      this.releaseDate,
      this.revenue,
      this.runtime,
      required super.id,
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
      super.videos,
      super.name,
      super.originalName});
  @override
  List<Object?> get props => [
    budget,
    super.originalName,
    super.name,
    productionCompanies,
    releaseDate,
    revenue,
    runtime,
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