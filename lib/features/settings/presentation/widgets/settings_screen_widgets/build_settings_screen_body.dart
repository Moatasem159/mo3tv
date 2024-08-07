import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_button.dart';
import 'package:mo3tv/core/widgets/custom_list_tile.dart';
class BuildSettingsScreenBody extends StatelessWidget {
  const BuildSettingsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CustomListTile(
          title: AppStrings.language,
          onTap:()=>GoRouter.of(context).pushNamed(Routes.languageRoute),
          icon: Icons.language_outlined,
        ),
        const Spacer(),
        const LoginButton(),
        10.ph,
        Text("Mo3Tv",style: AppTextStyles.get18BoldText(color: Colors.grey[700]!)),
        Text("Version 5.3.1",style: AppTextStyles.get14BoldText(color: Colors.grey[800]!)),
        10.ph,
      ],
    );
  }
}