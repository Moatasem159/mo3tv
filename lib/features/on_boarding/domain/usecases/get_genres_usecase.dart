import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/on_boarding/domain/repositories/genres_repository.dart';

class GetGenresUseCase {
  final GenresRepository _genresRepository;

  const GetGenresUseCase(this._genresRepository);

  Future<ApiResult<List<String>>> call(bool isMovie) async =>
      await _genresRepository.getGenres(isMovie);
}