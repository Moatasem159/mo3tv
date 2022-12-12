import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/image.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieGalleryUsecase extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  GetMovieGalleryUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, Gallery>> call(parameters) async{
    return await baseMovieRepository.getMovieGallery(movieId: parameters);
  }
}