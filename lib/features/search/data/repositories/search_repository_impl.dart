import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/search/data/datasources/search_datasource.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository{
  final NetworkInfo _networkInfo;
  final SearchDataSource _searchDataSource;
  SearchRepositoryImpl(this._networkInfo,this._searchDataSource);
  @override
  Future<Either<Failure, List<Search>>> search({required int page, required String word}) async {
    if (await _networkInfo.isConnected) {
      final result = await _searchDataSource.search(
          page: page, word: word);
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
}