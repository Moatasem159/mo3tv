import 'package:flutter/material.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/injection_container.dart';

class Routes {

  static const String initialRoute= "/";
  // static const String welcomeScreenRoute= "/welcomeScreen";
  static const String mainScreenRoute= "/mainScreen";
}



class AppRoute{


  static Route ? onGenerateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case Routes.initialRoute:
        login();
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      // case Routes.mainScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const MainScreen(),
      //   );



      default: undefinedRoute();
    }
    return null;
  }


  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }



}