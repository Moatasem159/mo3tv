import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/search/data/models/search_model.dart';
abstract class SearchLocalDataSource{
  Future<bool> saveSearch(SearchModel searchModel);
  Future<bool> clearOneSearch(SearchModel searchModel);
  Future<List<SearchModel>> getSearch();
  Future<bool> clearSearch();
}
class SearchLocalDataSourceImpl implements SearchLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  const SearchLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveSearch(SearchModel searchModel) async{
    final json=await _sharedPrefrencesConsumer.getData(key: "search");
    late List<SearchModel> searchList;
    bool found=false;
    if(json!=null) {
      searchList=SearchModel.decode(json);
    }
    else{
      searchList=[];
    }
    for (var element in searchList) {
      if(element.id==searchModel.id){
        found=true;
        break;
      }
    }
    if(found)
    {
      searchList.remove(searchModel);
      searchList.insert(0,searchModel);
    }
    else{
      searchList.insert(0,searchModel);
    }
    return await _sharedPrefrencesConsumer.saveData(key: "search", value: SearchModel.encode(searchList));
  }
  @override
  Future<List<SearchModel>> getSearch() async{
    final json=await _sharedPrefrencesConsumer.getData(key: "search");
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
    final res=await _sharedPrefrencesConsumer.remove(key:"search");
    return res;
  }
  @override
  Future<bool> clearOneSearch(SearchModel searchModel)async {
    final json=await _sharedPrefrencesConsumer.getData(key: "search");
    late List<SearchModel> searchList=SearchModel.decode(json);
    searchList.remove(searchModel);
    final res=await _sharedPrefrencesConsumer.saveData(key: "search", value: SearchModel.encode(searchList));
    return res;
  }
}