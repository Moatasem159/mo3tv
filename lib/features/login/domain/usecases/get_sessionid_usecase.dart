import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/login/domain/entities/session.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';

class GetSessionIdUsecase extends BaseUsecase{
  LoginRepository loginRepository;
  GetSessionIdUsecase({required this.loginRepository});
  @override
  Future<Either<Failure, Session>> call(parameters) async{
    return await loginRepository.getSessionId(token: parameters);
  }
}