import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class MoviesRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource baseMovieRemoteDataSource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl( {required this.networkInfo,required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(
      {required int page}) async {
    if(await networkInfo.isConnected)
      {
        final result = await baseMovieRemoteDataSource.getNowPlayingMovies(
            page: page);

        try {
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({required int page}) async {
    if(await networkInfo.isConnected)
      {
        final result = await baseMovieRemoteDataSource.getPopularMovies(page: page);

        try {
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
    else{
    return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({required int page}) async {
   if(await networkInfo.isConnected)
     {
       final result = await baseMovieRemoteDataSource.getTopRatedMovies(
           page: page);

       try {
         return Right(result);
       } on ServerException catch (failure) {
         return Left(ServerFailure(failure.message!));
       }
     }
   else{
     return left(const ServerFailure("No Internet Connections"));
   }

  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails({required int movieId}) async {
    if(await networkInfo.isConnected){
      final result = await baseMovieRemoteDataSource.getMovieDetails(
          movieId: movieId);

      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendations({required int movieId, required int page}) async {
    if(await networkInfo.isConnected)
      {
        final result = await baseMovieRemoteDataSource.getMovieRecommendations(
            page: page, movieId: movieId);

        try {
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
    else{
     return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getMovieReviews({required int movieId}) async{
   if(await networkInfo.isConnected)
     {
       final result = await baseMovieRemoteDataSource.getMovieReviews(movieId: movieId);

       try {
         return Right(result);
       } on ServerException catch (failure) {
         return Left(ServerFailure(failure.message!));
       }
     }
   else{
     return left(const ServerFailure("No Internet Connections"));
   }
  }

  @override
  Future<Either<Failure, List<CastMember>>> getMovieCredits({required int movieId}) async{
    if(await networkInfo.isConnected)
      {
        final result = await baseMovieRemoteDataSource.getMovieCredits(movieId: movieId);
        try {
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
    else{
    return left(const ServerFailure("No Internet Connections"));

    }
  }

  @override
  Future<Either<Failure, Gallery>> getMovieGallery({required int movieId}) async{

    if(await networkInfo.isConnected)
      {
        final result = await baseMovieRemoteDataSource.getMovieGallery(movieId: movieId);
        try {
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }

      }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, Message>> deleteMovieRate({required int movieId})async {
    if(await networkInfo.isConnected)
    {
      final result = await baseMovieRemoteDataSource.deleteMovieRate(movieId: movieId);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }

    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, Message>> rateMovie({required rate,required int movieId})async {
    if(await networkInfo.isConnected)
    {
      final result = await baseMovieRemoteDataSource.rateMovie(rate: rate,movieId: movieId);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }

    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, Message>> markMovieFav({required int movieId, required bool fav})async {
    if(await networkInfo.isConnected)
    {
      final result = await baseMovieRemoteDataSource.markMovieAsFavourite(movieId: movieId,fav: fav);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }

    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, Message>> addMovieToWatchlist({required int movieId, required bool watchlist}) async{
    if(await networkInfo.isConnected)
    {
      final result = await baseMovieRemoteDataSource.addMovieToWatchList(movieId: movieId,watchList: watchlist);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }

    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies({required int page})async {
    if(await networkInfo.isConnected)
    {
      final result = await baseMovieRemoteDataSource.getTrendingMovies(page: page);

      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure("No Internet Connections"));
    }
  }
}
