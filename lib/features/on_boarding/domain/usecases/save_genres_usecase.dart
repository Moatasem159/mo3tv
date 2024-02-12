import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/on_boarding/domain/repositories/genres_repository.dart';
class SaveGenresUseCase {
  final GenresRepository _genresRepository;
  const SaveGenresUseCase(this._genresRepository);
  Future<Either<Failure, void>> call({required List<String> movieGenres, required List<String>tvGenres})
  async => await _genresRepository.saveGenres(movieGenres: movieGenres, tvGenres: tvGenres);
}