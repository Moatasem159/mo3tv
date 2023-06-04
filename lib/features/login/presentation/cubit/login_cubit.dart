import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/login/domain/entities/session.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/login/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._getTokenUsecase,this._getSessionIdUsecase) : super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  final GetTokenUsecase _getTokenUsecase;
  final GetSessionIdUsecase _getSessionIdUsecase;
  Token? token;
  Future<void> getToken()async {
    emit(GetTokenLoadingState());
    Either<Failure, Token> response =
    await _getTokenUsecase.call();
    response.fold((l){
      return emit(GetTokenErrorState(msg: l.message));
    }, (r){
      token=r;
      emit(GetTokenSuccessState());
    });
  }
  Future<void> getSessionId()async {
    emit(GetSessionIdLoadingState());
    Either<Failure, Session> response =
    await _getSessionIdUsecase.call(token: token!.token!);
    emit(response.fold(
        (l) => GetSessionIdErrorState(msg: l.message),
        (r) => GetSessionIdSuccessState(r.sessionId!)));
  }
  initial(){
    emit(LoginInitialState());
  }
  success(){
    emit(SuccessState());
  }
}
