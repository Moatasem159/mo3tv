import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
abstract class TvRepository{
  Future<Either<Failure,List<TvShow>>> getTvShowsList({required int page,required String listType,required String lang});
  Future<Either<Failure,List<TvShow>>> getTrendingTvShows({required int page,required String lang});
  Future<Either<Failure,TvShow>> getTvShowDetails({required int tvShowId,required String lang});
  Future<Either<Failure,TvShowSeason>> getTvShowSeasonDetails({required int tvShowId,required int seasonNumber,required String lang});
  Future<Either<Failure,List<TvShow>>> getTvShowRecommendations({required int tvId,required String lang});
  Future<Either<Failure,Message>> markTvShow({required int tvId,required bool mark,required String markType});
  Future<Either<Failure,Message>> deleteTvShowRate({required int tvId});
  Future<Either<Failure,Message>> rateTvShow({required dynamic rate,required int tvId});
  Future<Either<Failure,List<TvShow>>> getSimilarTvShows({required int tvId,required int page,required String lang});
}