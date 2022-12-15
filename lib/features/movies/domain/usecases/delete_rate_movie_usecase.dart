import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class DeleteRateMovieUseCase extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  DeleteRateMovieUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, Message>> call(parameters) async{
    return await baseMovieRepository.deleteMovieRate(movieId: parameters);
  }
}