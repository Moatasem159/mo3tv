import 'package:equatable/equatable.dart';
import 'package:mo3tv/core/entities/video.dart';
import 'package:mo3tv/core/models/keywords_model.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
//ignore: must_be_immutable
class Movie extends Equatable{
  final bool ?adult;
  final String ?backdropPath;
  final dynamic belongsToCollection;
  final dynamic budget;
  final List<GenreModel>? genres;
  final List<GenreModel>? keywords;
  final String ?homepage;
  final int ?id;
  final String? imdbId;
  final String ?originalLanguage;
  final String ?originalTitle;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final List<ProductionCompany> ?productionCompanies;
  final String?releaseDate;
  final  dynamic revenue;
  final dynamic runtime;
  final String? status;
  final String ?tagline;
  final String? title;
  final dynamic voteAverage;
  final dynamic voteCount;
  MediaAccountDetails? movieAccountDetails;
  Video? trailer;
  final List<Video>?videos;
  Movie({
    this.videos,
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
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
        title,
        backdropPath,
        overview,
        voteAverage,
        releaseDate,
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        imdbId,
        originalLanguage,
        originalTitle,
        trailer
      ];
}








