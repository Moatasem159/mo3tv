import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/media/data/datasources/movie_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/repositories/movie_repository.dart';
class MoviesRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final NetworkInfo _networkInfo;
  const MoviesRepositoryImpl(this._networkInfo,this._movieRemoteDataSource);
  @override
  Future<Either<Failure,Movie>> getMovieDetails(MediaParams params) async {
    return executeAndHandleError<Movie>(() => _movieRemoteDataSource.getMovieDetails(params),_networkInfo);
  }

}