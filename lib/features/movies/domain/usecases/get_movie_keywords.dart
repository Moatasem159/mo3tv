import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/keyword.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieKeywords extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  GetMovieKeywords(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Keyword>>> call(parameters) async{
    return await baseMovieRepository.getMovieKeywords(movieId: parameters);
  }
}