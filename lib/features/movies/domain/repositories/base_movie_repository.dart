import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/review.dart';


abstract class MovieRepository{
Future<Either<Failure,List<Movie>>> getNowPlayingMovies({required int page});
Future<Either<Failure,List<Movie>>> getPopularMovies({required int page});
Future<Either<Failure,List<Movie>>> getTrendingMovies({required int page});
Future<Either<Failure,List<Movie>>> getTopRatedMovies({required int page});
Future<Either<Failure,Movie>> getMovieDetails({required int movieId});
Future<Either<Failure,Message>> rateMovie({required dynamic rate,required int movieId});
Future<Either<Failure,Message>> markMovieFav({required int movieId,required bool fav});
Future<Either<Failure,Message>> addMovieToWatchlist({required int movieId,required bool watchlist});
Future<Either<Failure,Message>> deleteMovieRate({required int movieId});
Future<Either<Failure,Gallery>> getMovieGallery({required int movieId});
Future<Either<Failure,List<Review>>> getMovieReviews({required int movieId});
Future<Either<Failure,List<CastMember>>> getMovieCredits({required int movieId});
Future<Either<Failure,List<Movie>>> getMovieRecommendations({required int movieId,required int page});
}