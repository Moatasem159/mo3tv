import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/search/data/datasources/search_local_data_source.dart';
import 'package:mo3tv/features/search/data/datasources/search_remote_datasource.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository{
  final NetworkInfo _networkInfo;
  final SearchRemoteDataSource _searchDataSource;
  final SearchLocalDataSource _searchLocalDataSource;
  SearchRepositoryImpl(this._networkInfo,this._searchDataSource, this._searchLocalDataSource);
  @override
  Future<Either<Failure, List<Search>>> search({required int page, required String word,required String lang}) async {
    if (await _networkInfo.isConnected) {
      final result = await _searchDataSource.search(page: page, word: word,lang: lang);
      try {
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else {
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure,bool>> saveSearch({required Search search})async {
    try{
      final res =await _searchLocalDataSource.saveSearch(search as SearchModel);
      return right(res);
    }on CacheException catch(failure){
      return Left(CacheFailure(failure.toString()));
    }
  }
  @override
  Future<Either<Failure, List<Search>>> getListSearch() async{
    try{
      final res =await _searchLocalDataSource.getSearch();
      return right(res);
    }on CacheException catch(failure){
      return Left(CacheFailure(failure.toString()));
    }
  }
  @override
  Future<Either<Failure, bool>> clearListSearch()async {
    try{
      final res =await _searchLocalDataSource.clearSearch();
      return right(res);
    }on CacheException catch(failure){
      return Left(CacheFailure(failure.toString()));
    }
  }
  @override
  Future<Either<Failure, bool>> clearOneSearch({required Search search}) async{
    try{
      final res =await _searchLocalDataSource.clearOneSearch(search as SearchModel);
      return right(res);
    }on CacheException catch(failure){
      return Left(CacheFailure(failure.toString()));
    }
  }
}