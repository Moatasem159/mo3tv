import 'package:flutter/material.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/app/injection_container.dart';

class Routes {
  static const String initialRoute= "/";
}



class AppRoute{


  static Route ? onGenerateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case Routes.initialRoute:
        login();
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      default: undefinedRoute();
    }
    return null;
  }


  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }



}