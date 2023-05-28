import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
abstract class LangRepository {
  Future<Either<Failure,bool>> changeLang({required String langCode});
  Future<Either<Failure,String>> getSavedLang();
}