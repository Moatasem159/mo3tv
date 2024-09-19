import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/domain/entities/log_out_entity.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/auth/domain/usecases/log_out_usecase.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogStates> {
  LogCubit(
      this._getTokenUsecase, this._getSessionIdUsecase, this._logOutUsecase)
      : super(LogInitialState());

  static LogCubit get(context) => BlocProvider.of(context);
  final LogOutUsecase _logOutUsecase;
  final GetTokenUsecase _getTokenUsecase;
  final GetSessionIdUsecase _getSessionIdUsecase;
  late Token token;

  Future<void> getToken() async {
    emit(GetTokenLoadingState());
    ApiResult<Token> response = await _getTokenUsecase();
    switch (response) {
      case ApiSuccess<Token>():
        token = response.data;
        emit(GetTokenSuccessState());
      case ApiFailure<Token>():
        emit(GetTokenErrorState(msg: response.failure.message));
    }
  }

  Future<void> getSessionId() async {
    emit(GetSessionIdLoadingState());
    ApiResult<Session> response =
        await _getSessionIdUsecase(token: token.token);
    switch (response) {
      case ApiSuccess<Session>():
        AppStrings.sessionId = response.data.sessionId;
        emit(GetSessionIdSuccessState(response.data.sessionId));
      case ApiFailure<Session>():
        emit(GetSessionIdErrorState(msg: response.failure.message));
    }
  }

  Future<void> logOut() async {
    emit(LogOutLoadingState());
    ApiResult<LogOut> res =
        await _logOutUsecase(sessionId: AppStrings.sessionId);
    switch (res) {
      case ApiSuccess<LogOut>():
        if (res.data.success == true) {
          AppStrings.sessionId = '';
          emit(LogOutSuccessState());
        } else {
          emit(LogOutErrorState());
        }
      case ApiFailure<LogOut>():
        emit(LogOutErrorState());
    }
  }
}