import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/login/domain/entities/session.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/login/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({
    required this.getTokenUsecase,
    required this.getSessionIdUsecase,
    required this.sharedPrefrencesConsumer,
}) : super(LoginInitialState());
  GetTokenUsecase getTokenUsecase;
  GetSessionIdUsecase getSessionIdUsecase;
   SharedPrefrencesConsumer sharedPrefrencesConsumer;
  Token? token;


  Future<void> getToken()async {
    emit(GetTokenLoadingState());
    Either<Failure, Token> response =
    await getTokenUsecase.call(const NoParameters());
    response.fold((l){
      return emit(GetTokenErrorState(msg: l.message));
    }, (r){
      token=r;
      emit(GetTokenSuccessState());
    });
  }
  Future<void> getSessionId({bool account=false,required BuildContext context})async {
    emit(GetSessionIdLoadingState());
    Either<Failure, Session> response =
    await getSessionIdUsecase.call(token!.token!);
    response.fold((l){
      return emit(GetSessionIdErrorState(msg: l.message));
    }, (r){
      sharedPrefrencesConsumer.saveData(
          key: AppStrings.id, value:r.sessionId);
      AppStrings.sessionId=r.sessionId!;
      if(account){
        Navigator.pushNamedAndRemoveUntil(context, Routes.initialRoute, (route) => false);
      }
      emit(GetSessionIdSuccessState());
    });
  }




  initial(){
    emit(LoginInitialState());
  }
  success(){
    emit(SuccessState());
  }
}
