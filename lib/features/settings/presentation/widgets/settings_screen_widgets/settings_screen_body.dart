import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/settings/presentation/widgets/settings_screen_widgets/build_settings_screen_body.dart';
class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            leadingWidth: 50,
            leading: const Icon(Icons.settings_rounded),
            title:  Text(AppStrings.settings.tr(context)!,style: AppTextStyles.get18BoldText(),),
          ),
          body: const BuildSettingsScreenBody(),
        ));
  }
}

