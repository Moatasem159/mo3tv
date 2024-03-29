import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/media/domain/entities/keyword.dart';
import 'package:mo3tv/features/media/data/models/media_account_details_model.dart';
import 'package:mo3tv/features/media/data/models/network_model.dart';
import 'package:mo3tv/features/media/domain/entities/video.dart';
// ignore: must_be_immutable
abstract class Media extends Equatable {
  final int id;
  final num voteCount;
  final num popularity;
  final num voteAverage;
  final String name;
  final String status;
  final String tagline;
  final String overview;
  final String homepage;
  final String posterPath;
  final String releaseDate;
  final String originalName;
  final String backdropPath;
  final String originalLanguage;
  final List<Video> videos;
  final List<Keyword> genres;
  final List<Keyword> keywords;
  final List<Network> productionCompanies;
  Video? trailer;
  MediaAccountDetails? mediaAccountDetails;
  Media({
    required this.name,
    required this.originalName,
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    this.genres=const[],
    this.keywords=const[],
    this.productionCompanies=const[],
    this.homepage='',
    this.status='',
    this.releaseDate='',
    this.tagline='',
    this.originalLanguage='',
    this.overview='',
    this.popularity=0,
    this.voteAverage=0,
    this.voteCount=0,
    this.videos=const [],
    this.mediaAccountDetails,
    this.trailer,
  });
  @override
  List<Object?> get props => [
    id,
    voteCount,
    popularity,
    voteAverage,
    name,
    status,
    tagline,
    overview,
    homepage,
    posterPath,
    releaseDate,
    originalName,
    backdropPath,
    originalLanguage,
    videos,
    productionCompanies,
    genres,
    keywords,
    trailer,
    mediaAccountDetails,
  ];
}