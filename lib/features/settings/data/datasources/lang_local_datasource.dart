import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}
class LangLocaleDataSourceImpl implements LangLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  LangLocaleDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> changeLang({required String langCode}) async{
  return await _sharedPrefrencesConsumer.saveData(key: AppStrings.locale,value: langCode);
  }

  @override
  Future<String?> getSavedLang() async=>
      _sharedPrefrencesConsumer.containsKey(key: AppStrings.locale)?
      _sharedPrefrencesConsumer.getData(key:AppStrings.locale):AppStrings.englishCode;
}