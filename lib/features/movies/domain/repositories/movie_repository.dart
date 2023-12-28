import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/media_params.dart';
abstract class MovieRepository{
  Future<Either<Failure,Movie>> getMovieDetails(MediaParams params);
  Future<Either<Failure,List<Movie>>> getMoviesList(MediaParams params);
  Future<Either<Failure,List<Movie>>> getMovieRecommendations(MediaParams params);
  Future<Either<Failure,List<Movie>>> getSimilarMovies(MediaParams params);
  Future<Either<Failure,Message>> rateMovie(MediaParams params);
  Future<Either<Failure,Message>> deleteMovieRate(MediaParams params);
  Future<Either<Failure,Message>> markMovie(MediaParams params);
}