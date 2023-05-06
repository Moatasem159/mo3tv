import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMovieGalleryUsecase extends BaseUsecase{
  final MovieRepository _movieRepository;
  GetMovieGalleryUsecase(this._movieRepository);
  @override
  Future<Either<Failure, Gallery>> call(parameters) async{
    return await _movieRepository.getMovieGallery(movieId: parameters);
  }
}