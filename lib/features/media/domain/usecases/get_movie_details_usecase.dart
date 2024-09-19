import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/repositories/movie_repository.dart';

class GetMovieDetailsUseCase {
  final MovieRepository _movieRepository;

  const GetMovieDetailsUseCase(this._movieRepository);

  Future<ApiResult<Movie>> call(MediaParams params) async =>
      await _movieRepository.getMovieDetails(params);
}