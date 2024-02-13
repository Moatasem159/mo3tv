import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/on_boarding/domain/repositories/genres_repository.dart';
class GetGenresUseCase {
  final GenresRepository _genresRepository;
  const GetGenresUseCase(this._genresRepository);
  Future<Either<Failure,List<String>>> call(bool isMovie)async => await _genresRepository.getGenres(isMovie);
}