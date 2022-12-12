import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';

class GetTokenUsecase extends BaseUsecase{
  LoginRepository loginRepository;
  GetTokenUsecase({required this.loginRepository});
  @override
  Future<Either<Failure, Token>> call(parameters) async{
    return await loginRepository.getToken();
  }
}