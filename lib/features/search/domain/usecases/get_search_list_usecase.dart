import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';

class GetSearchListUsecase {
  final SearchRepository _searchRepository;

  const GetSearchListUsecase(this._searchRepository);

  Future<ApiResult<List<Search>>> call() async =>
      await _searchRepository.getListSearch();
}