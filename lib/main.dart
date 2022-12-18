import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart'as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer=AppBlocObserver();
  SharedPrefrencesConsumer sharedPrefrencesConsumer=di.sl<SharedPrefrencesConsumer>();
  if(sharedPrefrencesConsumer.getData(key: AppStrings.id)!=null) {
    AppStrings.sessionId=sharedPrefrencesConsumer.getData(key: AppStrings.id);
  }
  runApp(const Mo3Tv());
}



