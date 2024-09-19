import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<ApiResult<List<Search>>> search(
      {required int page, required String word, required String lang});

  Future<ApiResult<bool>> saveSearch({required Search search});

  Future<ApiResult<List<Search>>> getListSearch();

  Future<ApiResult<bool>> clearListSearch();

  Future<ApiResult<bool>> clearOneSearch({required Search search});
}