import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_cubit.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_state.dart';
import 'package:mo3tv/features/home/presentation/widgets/main_bottom_nav_bar.dart';
class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckConnectivityCubit, CheckConnectivityStates>(
      listener: CheckConnectivityCubit.get(context).listen,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.darkBackgroundColor,
            systemNavigationBarColor: AppColors.darkBackgroundColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
        child: PopScope(
          canPop: navigationShell.currentIndex==0?true:false,
          onPopInvoked: (_) async{
            if (navigationShell.currentIndex != 0) {
              navigationShell.goBranch(0);
            }
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body:navigationShell,
              bottomNavigationBar:MainBottomNavbar(navigationShell: navigationShell),
            ),
          ),
        ),
      )
    );
  }
}