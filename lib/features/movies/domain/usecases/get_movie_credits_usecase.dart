import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/cast.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieCreditsUsecase extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  GetMovieCreditsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<CastMember>>> call(parameters) async{
    return await baseMovieRepository.getMovieCredits(movieId: parameters);
  }
}