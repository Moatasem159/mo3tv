import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_cubit/log_cubit.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
part 'login_dialog.dart';
part 'login_button_widget.dart';
part '../loading_indicator.dart';
part '../log_out_widgets/log_out_button.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(di.sl(), di.sl(),di.sl()),
      child: BlocConsumer<LogCubit, LogStates>(
        listener: (context, state) async{
          if (state is GetSessionIdSuccessState) {
            AccountCubit.get(context).getAccountDetails();
            showDialog(context: context, barrierDismissible: false ,builder: (_) => const LoginDialog(inOnBoarding: false));
          }
          if (state is GetTokenSuccessState) {
            context.pushNamed(Routes.loginRoute, extra: LogCubit.get(context),pathParameters: {"token":LogCubit.get(context).token.token});
          }
          if (state is LogOutSuccessState) {
            AccountCubit.get(context).getAccountDetails();
            Box box1=await Hive.openBox("movieGenres");
            Box box2=await Hive.openBox("tvGenres");
            await box1.clear();
            await box2.clear();
            await box1.close();
            await box2.close().then((_) =>context.goNamed(Routes.movieRoute));
          }
        },
        builder: (context, state) {
          if (state is GetTokenLoadingState || state is GetSessionIdLoadingState||state is LogOutLoadingState) {
            return const _LoadingIndicator();
          }
          if(AppStrings.sessionId=="") {
            return const _LoginButtonWidget();
          }
          if(AppStrings.sessionId!="") {
            return const _LogoutButton();
          }
          return const SizedBox();
        },
      ),
    );
  }
}