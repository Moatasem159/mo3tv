import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefrencesManager extends SharedPrefrencesConsumer{
   final  SharedPreferences _sharedPreferences;
  SharedPrefrencesManager(this._sharedPreferences);
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
  dynamic clear({required String key})
  {
    return _sharedPreferences.remove(key);
  }
}