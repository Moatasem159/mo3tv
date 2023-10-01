import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/settings/domain/repositories/lang_repository.dart';
class ChangeLangUseCase{
  final LangRepository _langRepository;
  ChangeLangUseCase(this._langRepository);
  Future<Either<Failure, bool>> call({String ?lang})async =>await _langRepository.changeLang(langCode: lang!);
}