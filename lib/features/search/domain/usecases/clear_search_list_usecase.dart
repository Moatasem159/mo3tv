import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';

class ClearSearchListUsecase {
  final SearchRepository _searchRepository;

  const ClearSearchListUsecase(this._searchRepository);

  Future<ApiResult<bool>> call() async =>
      await _searchRepository.clearListSearch();
}