import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/video.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieVideosUsecase extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  GetMovieVideosUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Video>>> call(parameters) async{
    return await baseMovieRepository.getMovieVideos(movieId: parameters);
  }

}