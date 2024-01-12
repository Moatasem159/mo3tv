import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/search/data/datasources/search_local_data_source.dart';
import 'package:mo3tv/features/search/data/datasources/search_remote_datasource.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository{
  final BaseRepository _baseRepository;
  final SearchRemoteDataSource _searchDataSource;
  final SearchLocalDataSource _searchLocalDataSource;
  const SearchRepositoryImpl(this._baseRepository,this._searchDataSource, this._searchLocalDataSource);
  @override
  Future<Either<Failure, List<Search>>> search({required int page, required String word,required String lang}) async {
    return _baseRepository.execute<List<Search>>(() => _searchDataSource.search(word: word, page: page, lang: lang));
  }
  @override
  Future<Either<Failure,bool>> saveSearch({required Search search})async {
    return _baseRepository.execute<bool>(() => _searchLocalDataSource.saveSearch(search as SearchModel));
  }
  @override
  Future<Either<Failure, List<Search>>> getListSearch() async{
    return _baseRepository.execute<List<Search>>(() => _searchLocalDataSource.getSearch());
  }
  @override
  Future<Either<Failure, bool>> clearListSearch()async {
    return _baseRepository.execute<bool>(() => _searchLocalDataSource.clearSearch());
  }
  @override
  Future<Either<Failure, bool>> clearOneSearch({required Search search}) async{
    return _baseRepository.execute<bool>(() => _searchLocalDataSource.clearOneSearch(search as SearchModel));
  }
}