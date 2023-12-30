import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
abstract class MovieRepository{
  Future<Either<Failure,Movie>> getMovieDetails(MediaParams params);
}