import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class AccountRepositoryImpl implements AccountRepository{
  final NetworkInfo _networkInfo;
  final AccountRemoteDataSource _accountDataSource;
  final AccountLocalDataSource _accountLocalDataSource;
  AccountRepositoryImpl(this._networkInfo,this._accountDataSource, this._accountLocalDataSource);
  @override
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId})async{
    var result =await _accountLocalDataSource.getUser();
    if(result !=null)
      {
        return right(result);
      }
    else{
      if(await _networkInfo.isConnected)
      {
        try {
          result =await _accountDataSource.getAccountDetails(sessionId: sessionId);
          await _accountLocalDataSource.saveUser(accountModel: result);
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
      else{
        return left(const ServerFailure(AppStrings.noInternetConnection));
      }
    }
  }
  @override
  Future<Either<Failure,List<Movie>>> getFavouriteMovies()async{
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getFavouriteMovies();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else
    {
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,List<Movie>>> getMovieWatchList()async{
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getMovieWatchList();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,List<Movie>>> getRatedMovies()async {
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getRatedMovies();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,List<TvShow>>> getFavouriteTvShows()async {
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getFavouriteTvShows();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,List<TvShow>>> getRatedTvShows()async{
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getRatedTvShows();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,List<TvShow>>> getTvShowsWatchList()async {
    if(await _networkInfo.isConnected)
    {
      final result = await _accountDataSource.getTvShowsWatchList();
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}