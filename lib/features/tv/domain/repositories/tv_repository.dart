import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
abstract class TvRepository{
  Future<Either<Failure,List<TvShow>>> getNowPlayingTvShows({required int page});
  Future<Either<Failure,List<TvShow>>> getPopularTvShows({required int page});
  Future<Either<Failure,List<TvShow>>> getTrendingTvShows({required int page});
  Future<Either<Failure,List<TvShow>>> getTopRatedTvShows({required int page});
  Future<Either<Failure,TvShow>> getTvShowDetails({required int tvShowId});
  Future<Either<Failure,TvShowSeason>> getTvShowSeasonDetails({required int tvShowId,required int seasonNumber});
  Future<Either<Failure,List<TvShow>>> getTvShowRecommendations({required int tvId,required int page});
  Future<Either<Failure,Message>> markTvShowFav({required int tvId,required bool fav});
  Future<Either<Failure,Message>> addTvShowToWatchlist({required int tvId,required bool watchlist});
  Future<Either<Failure,Message>> deleteTvShowRate({required int tvId});
  Future<Either<Failure,Message>> rateTvShow({required dynamic rate,required int tvId});
}