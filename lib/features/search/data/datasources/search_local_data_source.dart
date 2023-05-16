import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
abstract class SearchLocalDataSource{
  Future<bool> saveSearch(SearchModel searchModel);
  Future<bool> clearOneSearch(SearchModel searchModel);
  Future<List<SearchModel>> getSearch();
  Future<bool> clearSearch();
}
class SearchLocalDataSourceImpl implements SearchLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  SearchLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveSearch(SearchModel searchModel) async{
    final json=await _sharedPrefrencesConsumer.getData(key: AppStrings.search);
    late List<SearchModel> searchList;
    if(json!=null) {
      searchList=SearchModel.decode(json);
    }
    else{
      searchList=[];
    }
    if(!searchList.contains(searchModel)) {
      searchList.add(searchModel);
    }
    final res=await _sharedPrefrencesConsumer.saveData(key: AppStrings.search, value: SearchModel.encode(searchList));
    return res;
  }
  @override
  Future<List<SearchModel>> getSearch() async{
    final json=await _sharedPrefrencesConsumer.getData(key: AppStrings.search);
    late List<SearchModel> searchList;
    if(json!=null) {
      searchList=SearchModel.decode(json);
    }
    else{
      searchList=[];
    }
    return searchList;
  }
  @override
  Future<bool> clearSearch() async{
    final res=await _sharedPrefrencesConsumer.clear(key: AppStrings.search);
    return res;
  }
  @override
  Future<bool> clearOneSearch(SearchModel searchModel)async {
    final json=await _sharedPrefrencesConsumer.getData(key: AppStrings.search);
    late List<SearchModel> searchList=SearchModel.decode(json);
    searchList.remove(searchModel);
    final res=await _sharedPrefrencesConsumer.saveData(key: AppStrings.search, value: SearchModel.encode(searchList));
    return res;
  }
}