import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/domain/entities/log_out_entity.dart';
import 'package:mo3tv/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_out_cubit/log_out_state.dart';
class LogOutCubit extends Cubit<LogOutStates> {
  LogOutCubit(this._logOutUsecase) : super(LogOutInitialState());
  static LogOutCubit get(context)=>BlocProvider.of(context);
  final LogOutUsecase _logOutUsecase;
  Future<void> logOut()async{
    emit(LogOutLoadingState());
    Either<Failure, LogOut> res =await _logOutUsecase.call(sessionId: AppStrings.sessionId);
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