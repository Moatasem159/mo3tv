import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/search/data/datasources/search_local_data_source.dart';
import 'package:mo3tv/features/search/data/datasources/search_remote_datasource.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository{
  final NetworkInfo _networkInfo;
  final SearchRemoteDataSource _searchDataSource;
  final SearchLocalDataSource _searchLocalDataSource;
  const SearchRepositoryImpl(this._networkInfo,this._searchDataSource, this._searchLocalDataSource);
  @override
  Future<Either<Failure, List<Search>>> search({required int page, required String word,required String lang}) async {
    return executeAndHandleError<List<Search>>(() => _searchDataSource.search(word: word, page: page, lang: lang),_networkInfo);
  }
  @override
  Future<Either<Failure,bool>> saveSearch({required Search search})async {
    return executeAndHandleError<bool>(() => _searchLocalDataSource.saveSearch(search as SearchModel),null);
  }
  @override
  Future<Either<Failure, List<Search>>> getListSearch() async{
    return executeAndHandleError<List<Search>>(() => _searchLocalDataSource.getSearch(),null);
  }
  @override
  Future<Either<Failure, bool>> clearListSearch()async {
    return executeAndHandleError<bool>(() => _searchLocalDataSource.clearSearch(),null);
  }
  @override
  Future<Either<Failure, bool>> clearOneSearch({required Search search}) async{
    return executeAndHandleError<bool>(() => _searchLocalDataSource.clearOneSearch(search as SearchModel),null);
  }
}