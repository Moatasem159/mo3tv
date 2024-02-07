import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/config/lang/app_localizations_setup.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_cubit.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_states.dart';
class Mo3Tv extends StatelessWidget {
  const Mo3Tv({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(create: (context) => CheckConnectivityCubit(di.sl())..checkConnectivity()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleStates>(
        buildWhen:LocaleCubit.buildWhen,
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRoute.router,
              themeMode: ThemeMode.dark,
              darkTheme: AppTheme.darkTheme,
              locale: state.locale,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback);
        },
      ),
    );
  }
}