import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/logout/data/models/log_out_model.dart';
import 'package:mo3tv/features/logout/domain/repositories/log_out_repository.dart';
class LogOutUsecase extends BaseUsecase{
  final LogOutRepository _accountRepository;
  LogOutUsecase(this._accountRepository);
  @override
  Future<Either<Failure,LogOutModel>> call(parameters) async{
    return await _accountRepository.logOut(sessionId: parameters);
  }
}