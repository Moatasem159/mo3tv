import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/repositories/movie_repository.dart';
import 'package:mo3tv/features/media/data/datasources/movie_remote_datasource.dart';

class MoviesRepositoryImpl implements MovieRepository {
  final BaseRepository _baseRepository;
  final MovieRemoteDataSource _movieRemoteDataSource;

  const MoviesRepositoryImpl(this._movieRemoteDataSource, this._baseRepository);

  @override
  Future<ApiResult<Movie>> getMovieDetails(MediaParams params) async {
    return _baseRepository
        .execute<Movie>(() => _movieRemoteDataSource.getMovieDetails(params));
  }
}