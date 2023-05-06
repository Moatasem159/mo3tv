import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class GetFavMoviesListUsecase{
  final AccountRepository _accountRepository;
  GetFavMoviesListUsecase(this._accountRepository);
  Future<Either<Failure,List<Movie>>> call() async{
    return await _accountRepository.getFavouriteMovies();
  }
}