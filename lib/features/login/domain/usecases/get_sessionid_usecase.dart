import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/login/domain/entities/session.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';
class GetSessionIdUsecase{
  final LoginRepository _loginRepository;
  GetSessionIdUsecase(this._loginRepository);
  Future<Either<Failure, Session>> call({required String token}) async{
    return await _loginRepository.getSessionId(token: token);
  }
}