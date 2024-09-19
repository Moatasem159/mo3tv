import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';

abstract class MovieRepository {
  Future<ApiResult<Movie>> getMovieDetails(MediaParams params);
}