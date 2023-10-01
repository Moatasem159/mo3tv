import 'package:equatable/equatable.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/models/media_account_details_model.dart';
import 'package:mo3tv/features/video/domain/entities/video.dart';
// ignore: must_be_immutable
abstract class Media extends Equatable {
  final int id;
  final String? name;
  final String ?originalName;
  final String? backdropPath;
  final List<Keyword>? genres;
  final List<Keyword>? keywords;
  final String? homepage;
  final String? status;
  final String? tagline;
  final String? originalLanguage;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final num? voteAverage;
  final num? voteCount;
  MediaAccountDetails? mediaAccountDetails;
  Video? trailer;
  final List<Video>? videos;
  Media({
      this.name,
      this.originalName,
      required this.id,
       this.backdropPath,
       this.genres,
       this.keywords,
       this.homepage,
       this.status,
       this.tagline,
       this.originalLanguage,
       this.overview,
       this.popularity,
       this.posterPath,
       this.voteAverage,
       this.voteCount,
       this.mediaAccountDetails,
       this.trailer,
       this.videos});
}