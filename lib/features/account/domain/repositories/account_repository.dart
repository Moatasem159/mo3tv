import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';

abstract class AccountRepository{




  Future<Either<Failure,List<Movie>>> getFavouriteMovies();
  Future<Either<Failure,List<Movie>>> getMovieWatchList();
  Future<Either<Failure,List<Movie>>> getRatedMovies();
}