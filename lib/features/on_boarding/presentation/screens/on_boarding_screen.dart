import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/core/extension/screen_size_extension.dart';
import 'package:mo3tv/features/on_boarding/presentation/widgets/background_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_cubit/log_cubit.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
part '../widgets/on_boarding_screen_widgets/skip_button.dart';
part '../widgets/on_boarding_screen_widgets/custom_dots.dart';
part '../widgets/on_boarding_screen_widgets/register_button.dart';
part '../widgets/on_boarding_screen_widgets/on_boarding_page.dart';
part '../widgets/on_boarding_screen_widgets/on_boarding_text.dart';
part '../widgets/on_boarding_screen_widgets/on_boarding_screen_body.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
      ),
      child:Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body:const _OnBoardingScreenBody(),
      ),
    );
  }
}