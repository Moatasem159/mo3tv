import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class TvShowRepositoryImpl extends TvRepository{
  final TvShowRemoteDataSource _tvShowRemoteDataSource;
  final NetworkInfo _networkInfo;
  TvShowRepositoryImpl(this._tvShowRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, List<TvShow>>> getNowPlayingTvShows({required int page})async {
    if(await _networkInfo.isConnected)
    {
      try{
        final result = await _tvShowRemoteDataSource.getNowPlayingTvShows(page: page);
        result.removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows({required int page})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.getPopularTvShows(page: page);
        result.removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows({required int page})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.getTopRatedTvShows(page: page);
        result.removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, TvShow>> getTvShowDetails({required int tvShowId})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final TvShow result = await _tvShowRemoteDataSource.getTvShowDetails(tvShowId: tvShowId);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<TvShow>>> getTvShowRecommendations({required int tvId, required int page})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.getTvShowRecommendations(page: page, tvId: tvId);
        result.removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<CastMember>>> getTvShowCredits({required int tvId})async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.getTvShowCredits(tvId: tvId);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));

    }
  }
  @override
  Future<Either<Failure, Message>> markTvShowFav({required int tvId, required bool fav}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.markTvShowAsFavourite(tvId: tvId,fav: fav);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, Message>> addTvShowToWatchlist({required int tvId, required bool watchlist})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.addTvShowToWatchList(tvId: tvId,watchList: watchlist);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }

  }
  @override
  Future<Either<Failure, Message>> deleteTvShowRate({required int tvId}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.deleteTvShowRate(tvId: tvId);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, Message>> rateTvShow({required rate, required int tvId}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.rateTvShow(rate: rate,tvId: tvId);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<TvShow>>> getTrendingTvShows({required int page}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _tvShowRemoteDataSource.getTrendingTvShows(page: page);
        result.removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, TvShowSeason>> getTvShowSeasonDetails({required int tvShowId, required int seasonNumber})async {
    if(await _networkInfo.isConnected){
      try {
        final TvShowSeason result = await _tvShowRemoteDataSource.getTvShowSeasonDetails(tvShowId: tvShowId, seasonNumber: seasonNumber);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}