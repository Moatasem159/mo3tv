import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_local_datasource.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MoviesRepositoryImpl implements MovieRepository {
  MoviesRepositoryImpl(this._networkInfo,this._movieRemoteDataSource,this._movieLocalDataSource);
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, List<Movie>>> getMoviesList({required int page,required String listType}) async {
    List<Movie> cachedMovies=[];
    if(await _networkInfo.isConnected)
      {
        if(page==1)
          {
            cachedMovies=await _movieLocalDataSource.getCachedMoviesList(listType: listType);
          }
        if(cachedMovies.isNotEmpty)
          {
            return right(cachedMovies);
          }
        else{
          try {
            final result = await _movieRemoteDataSource.getMoviesList(page: page,listType: listType);
            result.removeWhere((element) => element.backdropPath==''||element.posterPath=='');
            await _movieLocalDataSource.saveMovieList(movies: result, listType: listType);
            return Right(result);
          } on ServerException catch (failure) {
            return Left(ServerFailure(failure.message!));
          }
        }
      }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies({required int page})async {
    List<Movie> cachedMovies=[];
    if(await _networkInfo.isConnected)
    {
      if(page==1){
        cachedMovies=await _movieLocalDataSource.getCachedMoviesList(listType: "trending");
      }
      if(cachedMovies.isNotEmpty)
      {
        return right(cachedMovies);
      }
      else{
        try {
          final result = await _movieRemoteDataSource.getTrendingMovies(page: page);
          result.removeWhere((element) =>element.backdropPath==''||element.posterPath=='');
          await _movieLocalDataSource.saveMovieList(movies: result, listType: "trending");
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
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
  Future<Either<Failure, List<Movie>>> getMovieRecommendations({required int movieId}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final result = await _movieRemoteDataSource.getMovieRecommendations(movieId: movieId);
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
  Future<Either<Failure, List<Movie>>> getSimilarMovies({required int movieId, required int page}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.getSimilarMovies(movieId: movieId,page: page);
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
  Future<Either<Failure, Message>> markMovie({required int movieId, required bool mark,required String markType})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _movieRemoteDataSource.markMovie(movieId: movieId,mark: mark,markType:markType);
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