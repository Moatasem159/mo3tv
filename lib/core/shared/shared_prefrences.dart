import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefrencesManager implements SharedPrefrencesConsumer{
  final SharedPreferences _sharedPreferences;
  const SharedPrefrencesManager(this._sharedPreferences);
  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    return await _sharedPreferences.setDouble(key, value);
  }
  @override
  dynamic getData({required String key}){
    return _sharedPreferences.get(key);
  }
  @override
  dynamic remove({required String key}) async {
    return await _sharedPreferences.remove(key);
  }
  @override
  Future<bool> clearSharedPrefrences()async{
    return await _sharedPreferences.clear();
  }
   @override
   bool containsKey({required String key}){
     return _sharedPreferences.containsKey(key);
   }
}