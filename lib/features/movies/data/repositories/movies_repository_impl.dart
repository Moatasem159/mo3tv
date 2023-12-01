import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MoviesRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final NetworkInfo _networkInfo;
  const MoviesRepositoryImpl(this._networkInfo,this._movieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getMoviesList({required int page,required String listType,required String lang}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final List<Movie> result = await _movieRemoteDataSource.getMoviesList(page: page,listType: listType,lang: lang);
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
  Future<Either<Failure, List<Movie>>> getTrendingMovies({required int page,required String lang})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final List<Movie> result = await _movieRemoteDataSource.getTrendingMovies(page: page,lang: lang);
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
  Future<Either<Failure, Movie>> getMovieDetails({required int movieId,required String lang}) async {
    if(await _networkInfo.isConnected){
      try {
        final MovieModel result = await _movieRemoteDataSource.getMovieDetails(movieId: movieId,lang: lang);
          result.productionCompanies.removeWhere((e) =>e.logoPath=='');
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
  Future<Either<Failure, List<Movie>>> getMovieRecommendations({required int movieId,required String lang}) async {
    if(await _networkInfo.isConnected)
      {
        try {
          final List<Movie> result = await _movieRemoteDataSource.getMovieRecommendations(movieId: movieId,lang: lang);
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
  Future<Either<Failure, List<Movie>>> getSimilarMovies({required int movieId, required int page,required String lang}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final List<Movie> result = await _movieRemoteDataSource.getSimilarMovies(movieId: movieId,page: page,lang: lang);
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
        final Message result = await _movieRemoteDataSource.deleteMovieRate(movieId: movieId);
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
        final Message result = await _movieRemoteDataSource.rateMovie(rate: rate,movieId: movieId);
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
        final Message result = await _movieRemoteDataSource.markMovie(movieId: movieId,mark: mark,markType:markType);
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