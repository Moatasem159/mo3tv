import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';
class GetTokenUsecase{
  final LoginRepository _loginRepository;
  GetTokenUsecase(this._loginRepository);
  Future<Either<Failure, Token>> call() async{
    return await _loginRepository.getToken();
  }
}