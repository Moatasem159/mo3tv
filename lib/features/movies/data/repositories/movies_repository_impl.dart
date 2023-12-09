import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MoviesRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final NetworkInfo _networkInfo;
  const MoviesRepositoryImpl(this._networkInfo,this._movieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getMoviesList(MediaParams params) async {
    return executeAndHandleError<List<Movie>>(() => _movieRemoteDataSource.getMoviesList(params),_networkInfo);
  }
  @override
  Future<Either<Failure,List<Movie>>> getTrendingMovies(MediaParams params)async {
    return executeAndHandleError<List<Movie>>(() => _movieRemoteDataSource.getTrendingMovies(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Movie>> getMovieDetails(MediaParams params) async {
    return executeAndHandleError<Movie>(() => _movieRemoteDataSource.getMovieDetails(params),_networkInfo);
  }
  @override
  Future<Either<Failure,List<Movie>>> getMovieRecommendations(MediaParams params) async {
    return executeAndHandleError<List<Movie>>(() => _movieRemoteDataSource.getMovieRecommendations(params),_networkInfo);
  }
  @override
  Future<Either<Failure,List<Movie>>> getSimilarMovies(MediaParams params) async{
    return executeAndHandleError<List<Movie>>(() => _movieRemoteDataSource.getSimilarMovies(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> deleteMovieRate(MediaParams params)async {
    return executeAndHandleError<Message>(() => _movieRemoteDataSource.deleteMovieRate(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> rateMovie(MediaParams params)async {
    return executeAndHandleError<Message>(() => _movieRemoteDataSource.rateMovie(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> markMovie(MediaParams params)async {
    return executeAndHandleError<Message>(() => _movieRemoteDataSource.markMovie(params),_networkInfo);
  }
}