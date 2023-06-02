import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/video/domain/entities/video.dart';
import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
//ignore: must_be_immutable
class Movie extends Equatable {
  final String? backdropPath;
  final num? budget;
  final List<GenreModel>? genres;
  final List<GenreModel>? keywords;
  final String? homepage;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final String? releaseDate;
  final num? revenue;
  final num? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final num? voteAverage;
  final num? voteCount;
  MediaAccountDetails? movieAccountDetails;
  Video? trailer;
  final List<Video>? videos;
  Movie({
    this.videos,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.keywords,
    this.movieAccountDetails,
    this.trailer,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        budget,
        tagline,
        title,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        releaseDate,
        revenue,
        runtime,
        status,
        genres,
        homepage,
        keywords,
        movieAccountDetails,
        trailer,
        videos,
        voteCount,
        voteAverage,
        originalLanguage,
        originalTitle,
      ];
}