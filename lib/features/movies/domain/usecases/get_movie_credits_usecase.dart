import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';

class GetMovieCreditsUsecase extends BaseUsecase{
  final MovieRepository _movieRepository;
  GetMovieCreditsUsecase(this._movieRepository);
  @override
  Future<Either<Failure, List<CastMember>>> call(parameters) async{
    return await _movieRepository.getMovieCredits(movieId: parameters);
  }
}