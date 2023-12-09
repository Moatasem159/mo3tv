import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
abstract class TvRepository{
  Future<Either<Failure,List<TvShow>>> getTvShowsList(MediaParams params);
  Future<Either<Failure,List<TvShow>>> getTrendingTvShows(MediaParams params);
  Future<Either<Failure,TvShow>> getTvShowDetails(MediaParams params);
  Future<Either<Failure,List<TvShow>>> getTvShowRecommendations(MediaParams params);
  Future<Either<Failure,TvShowSeason>> getTvShowSeasonDetails(MediaParams params);
  Future<Either<Failure,List<TvShow>>> getSimilarTvShows(MediaParams params);
  Future<Either<Failure,Message>> deleteTvShowRate(MediaParams params);
  Future<Either<Failure,Message>> rateTvShow(MediaParams params);
  Future<Either<Failure,Message>> markTvShow(MediaParams params);
}