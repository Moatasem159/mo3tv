import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_state.dart';
import 'package:restart_app/restart_app.dart';
class CheckConnectivityCubit extends Cubit<CheckConnectivityStates>{
  CheckConnectivityCubit(this._networkInfo) : super(CheckConnectivityInitialState()){
    location='';
  }
  final NetworkInfo _networkInfo;
  late  String location;
  late StreamSubscription<InternetConnectionStatus> checkStream;
  static CheckConnectivityCubit get(context) => BlocProvider.of(context);
  Future<void> checkConnectivity() async {
    checkStream= _networkInfo.checkConnection().listen((event) {
      if(event== InternetConnectionStatus.disconnected)
      {
        checkStream.cancel();
        emit(DisconnectedState());
      }
    });
  }
  Future<void> checkAgain()async{
    emit(CheckConnectivityLoadingState());
    await Future.delayed(const Duration(milliseconds: 1000));
    if(await _networkInfo.isConnected){
      emit(ConnectedState());
      checkConnectivity();
    }else{
      emit(ErrorState());
    }
  }
 listen(context,state){
    if (state is DisconnectedState) {
      if(location.isEmpty){
        location=GoRouter.of(context).location();
      }
      GoRouter.of(context).pushNamed(Routes.noConnectionRoute);
    }
    if(state is ConnectedState)
      {
      if(location==Routes.initialRoute)
          {
            Restart.restartApp();
          }
        else{
          location='';
          GoRouter.of(context).pop();
        }
      }
}
}
extension GoRouterExtension on GoRouter {
  String location() {
    final RouteMatch lastMatch = AppRoute.router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : AppRoute.router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
}