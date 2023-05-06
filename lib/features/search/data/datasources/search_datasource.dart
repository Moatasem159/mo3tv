import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';

abstract class SearchDataSource{
  Future<List<SearchModel>> search({required String word,required int page});
}
class SearchDataSourceImpl extends SearchDataSource{
  final ApiConsumer _apiConsumer;
  SearchDataSourceImpl(this._apiConsumer);
  @override
  Future<List<SearchModel>> search({required String word,required int page}) async{
    final response = await _apiConsumer.get(EndPoints.searchUrl(query: word,page: page));
    return List<SearchModel>.from(
      (response['results'] as List).map(
            (x) => SearchModel.fromJson(x),
      ),
    );
  }
}