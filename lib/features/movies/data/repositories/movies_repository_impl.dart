import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MoviesRepositoryImpl extends MovieRepository {
  MoviesRepositoryImpl(this._networkInfo,this._movieRemoteDataSource);
  final MovieRemoteDataSource _movieRemoteDataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies({required int page}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final result = await _movieRemoteDataSource.getNowPlayingMovies(page: page);
          result.removeWhere((element) => element.backdropPath==''||element.posterPath=='');
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
  Future<Either<Failure, List<Movie>>> getPopularMovies({required int page}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final result = await _movieRemoteDataSource.getPopularMovies(page: page);
          result.removeWhere((element) =>element.backdropPath==''||element.posterPath=='');
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
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({required int page}) async {
   if(await _networkInfo.isConnected)
     {
       try {
         final result = await _movieRemoteDataSource.getTopRatedMovies(page: page);
         result.removeWhere((element) =>element.backdropPath==''||element.posterPath=='');
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
  Future<Either<Failure, Movie>> getMovieDetails({required int movieId}) async {
    if(await _networkInfo.isConnected){
      try {
        final MovieModel result = await _movieRemoteDataSource.getMovieDetails(movieId: movieId);
          result.productionCompanies!.removeWhere((e) =>e.logoPath=='');
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
  Future<Either<Failure, List<Movie>>> getMovieRecommendations({required int movieId, required int page}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final result = await _movieRemoteDataSource.getMovieRecommendations(page: page, movieId: movieId);
          result.removeWhere((element) => element.backdropPath==''||element.posterPath=='');
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
  Future<Either<Failure, List<CastMember>>> getMovieCredits({required int movieId}) async{
    if(await _networkInfo.isConnected)
      {
        try {
          final result = await _movieRemoteDataSource.getMovieCredits(movieId: movieId);
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
  Future<Either<Failure, Message>> deleteMovieRate({required int movieId})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.deleteMovieRate(movieId: movieId);
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
  Future<Either<Failure, Message>> rateMovie({required rate,required int movieId})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.rateMovie(rate: rate,movieId: movieId);
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
  Future<Either<Failure, Message>> markMovieFav({required int movieId, required bool fav})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.markMovieAsFavourite(movieId: movieId,fav: fav);
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
  Future<Either<Failure, Message>> addMovieToWatchlist({required int movieId, required bool watchlist}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.addMovieToWatchList(movieId: movieId,watchList: watchlist);
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
  Future<Either<Failure, List<Movie>>> getTrendingMovies({required int page})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.getTrendingMovies(page: page);
        result.removeWhere((element) =>element.backdropPath==''||element.posterPath=='');
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
