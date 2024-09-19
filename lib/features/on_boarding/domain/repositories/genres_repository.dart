import 'package:mo3tv/core/api/api_result.dart';

abstract class GenresRepository {
  Future<ApiResult<void>> saveGenres(
      {required List<String> movieGenres, required List<String> tvGenres});

  Future<ApiResult<List<String>>> getGenres(bool isMovie);
}