import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';

class GetFavMoviesListUsecase extends BaseUsecase{
  final AccountRepository accountRepository;

  GetFavMoviesListUsecase({required this.accountRepository});

  @override
  Future<Either<Failure,List<Movie>>> call(parameters) async{
    return await accountRepository.getFavouriteMovies();
  }
}