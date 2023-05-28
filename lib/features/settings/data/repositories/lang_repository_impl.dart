import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/settings/data/datasources/lang_local_datasource.dart';
import 'package:mo3tv/features/settings/domain/repositories/lang_repository.dart';
class LangRepositoryImpl implements LangRepository{
  final LangLocalDataSource _langLocaleDataSource;
  LangRepositoryImpl(this._langLocaleDataSource);
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async{
    final langIsChanged=await _langLocaleDataSource.changeLang(langCode: langCode);
    return Right(langIsChanged);
  }
  @override
  Future<Either<Failure, String>> getSavedLang() async{
    final langCode=await _langLocaleDataSource.getSavedLang();
    return Right(langCode!);
  }
}