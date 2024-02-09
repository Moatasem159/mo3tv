import 'package:mo3tv/app/app.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/app/injection_container.dart'as di show init;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Mo3Tv());
}