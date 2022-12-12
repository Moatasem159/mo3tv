import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class RateMovieUseCase{
  final MovieRepository baseMovieRepository;
  RateMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure, Message>> call({dynamic rate,required int movieId}) async{
    return await baseMovieRepository.rateMovie(rate:rate,movieId:movieId);
  }
}