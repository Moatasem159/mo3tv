import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
abstract class SearchRemoteDataSource{
  Future<List<SearchModel>> search({required String word,required int page,required String lang});
}
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const SearchRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<SearchModel>> search({required String word,required int page,required String lang}) async{
    final response = await _apiConsumer.get(EndPoints.searchUrl(query: word,page: page,lang: lang));
    return List<SearchModel>.from((response['results'] as List).map((x) => SearchModel.fromJson(x)));
  }
}