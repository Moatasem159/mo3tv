import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/on_boarding/data/datasources/genres_local_datasource.dart';
import 'package:mo3tv/features/on_boarding/domain/repositories/genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresLocalDataSource _genresLocalDataSource;

  GenresRepositoryImpl(this._genresLocalDataSource);

  @override
  Future<ApiResult<void>> saveGenres(
      {required List<String> movieGenres,
      required List<String> tvGenres}) async {
    try {
      final void result = await _genresLocalDataSource.saveGenres(
          movieGenres: movieGenres, tvGenres: tvGenres);
      return ApiSuccess(result);
    } on CacheException catch (failure) {
      return ApiFailure(CacheFailure(failure.message!));
    }
  }

  @override
  Future<ApiResult<List<String>>> getGenres(bool isMovie) async {
    try {
      final List<String> result =
          await _genresLocalDataSource.getGenres(isMovie);
      return ApiSuccess(result);
    } on CacheException catch (failure) {
      return ApiFailure(CacheFailure(failure.message!));
    }
  }
}