import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/domain/entities/log_out_entity.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/auth/domain/usecases/log_out_usecase.dart';
part 'log_state.dart';
class LogCubit extends Cubit<LogStates> {
  LogCubit(this._getTokenUsecase,this._getSessionIdUsecase,this._logOutUsecase) : super(LogInitialState());
  static LogCubit get(context)=>BlocProvider.of(context);
  final LogOutUsecase _logOutUsecase;
  final GetTokenUsecase _getTokenUsecase;
  final GetSessionIdUsecase _getSessionIdUsecase;
  late Token token;
  Future<void> getToken()async {
    emit(GetTokenLoadingState());
    Either<Failure, Token> response =
    await _getTokenUsecase();
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
    await _getSessionIdUsecase(token: token.token);
    emit(response.fold(
        (l) => GetSessionIdErrorState(msg: l.message),
        (r){
          AppStrings.sessionId=r.sessionId;
          return GetSessionIdSuccessState(r.sessionId);
        }));
  }
  Future<void> logOut()async{
    emit(LogOutLoadingState());
    Either<Failure, LogOut> res =await _logOutUsecase(sessionId: AppStrings.sessionId);
    emit(res.fold(
            (l)=> LogOutErrorState(),
            (r){
          if(r.success==true) {
            AppStrings.sessionId='';
            return LogOutSuccessState();
          }
          else{
            return LogOutErrorState();
          }
        }));
  }
}
