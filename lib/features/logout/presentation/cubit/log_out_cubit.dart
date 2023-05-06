import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/logout/domain/entities/log_out_entity.dart';
import 'package:mo3tv/features/logout/domain/usecases/log_out_usecase.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_state.dart';
class LogOutCubit extends Cubit<LogOutStates> {
  LogOutCubit({required this.logOutUsecase}) : super(LogOutInitialState());
  static LogOutCubit get(context)=>BlocProvider.of(context);
  LogOutUsecase logOutUsecase;

  bool isLoggedOut=false;
  Future<void> logOut()async{
    emit(LogOutLoadingState());
    Either<Failure, LogOut> res =await logOutUsecase.call(AppStrings.sessionId);
    emit(res.fold((l){
      return LogOutErrorState();
    }, (r){
      if(r.success==true)
      {
        AppStrings.sessionId='';
        isLoggedOut=true;
        sl<SharedPrefrencesConsumer>().clear(key: AppStrings.id);
        return LogOutSuccessState();
      }
      else{
        return LogOutErrorState();
      }
    }));
  }
}
