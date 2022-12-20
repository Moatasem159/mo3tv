import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

abstract class AccountRepository{
  Future<Either<Failure,Account>> getAccountDetails();
  Future<Either<Failure,List<Movie>>> getFavouriteMovies();
  Future<Either<Failure,List<Movie>>> getMovieWatchList();
  Future<Either<Failure,List<Movie>>> getRatedMovies();
  Future<Either<Failure,List<TvShow>>> getFavouriteTvShows();
  Future<Either<Failure,List<TvShow>>> getTvShowsWatchList();
  Future<Either<Failure,List<TvShow>>> getRatedTvShows();
}