import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class TvShowRepositoryImpl extends TvRepository{

  final TvShowRemoteDataSource tvShowRemoteDataSource;
  final NetworkInfo networkInfo;

  TvShowRepositoryImpl({required this.tvShowRemoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, List<TvShow>>> getNowPlayingTvShows({required int page})async {
    if(await networkInfo.isConnected)
    {
      try{
        final result = await tvShowRemoteDataSource.getNowPlayingTvShows(page: page);
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getPopularTvShows(
          page: page);

      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTopRatedTvShows(
          page: page);

      try {
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
    if(await networkInfo.isConnected){
      final TvShow result = await tvShowRemoteDataSource.getTvShowDetails(
          tvShowId: tvShowId);

      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTvShowRecommendations(
          page: page, tvId: tvId);

      try {
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
  Future<Either<Failure, List<Review>>> getTvShowsReviews({required int tvId})async {
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTvShowsReviews(tvId: tvId);

      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTvShowCredits(tvId: tvId);
      try {
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
  Future<Either<Failure, Gallery>> getTvShowGallery({required int tvId}) async{
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTvShowGallery(tvId: tvId);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else
    {
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, Message>> markTvShowFav({required int tvId, required bool fav}) async{
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.markTvShowAsFavourite(tvId: tvId,fav: fav);
      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.addTvShowToWatchList(tvId: tvId,watchList: watchlist);
      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.deleteTvShowRate(tvId: tvId);
      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.rateTvShow(rate: rate,tvId: tvId);
      try {
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
    if(await networkInfo.isConnected)
    {
      final result = await tvShowRemoteDataSource.getTrendingTvShows(
          page: page);

      try {
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
  Future<Either<Failure, TvShowSeason>> getTvShowSeasonDetails(
      {required int tvShowId, required int seasonNumber})async {
    if(await networkInfo.isConnected){
      final TvShowSeason result = await tvShowRemoteDataSource.getTvShowSeasonDetails(
          tvShowId: tvShowId, seasonNumber: seasonNumber);

      try {
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