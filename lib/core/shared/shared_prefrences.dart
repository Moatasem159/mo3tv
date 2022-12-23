
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefrencesManager extends SharedPrefrencesConsumer{
   final  SharedPreferences sharedPreferences;
  SharedPrefrencesManager({required this.sharedPreferences});
  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }
  @override
  dynamic getData({required String key}){

    return sharedPreferences.get(key);
  }
  @override
  dynamic clear({required String key})
  {
    return sharedPreferences.remove(key);
  }
}
