import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/settings/presentation/widgets/language_screen_widgets/build_language_screen_body.dart';
class LanguageScreenBody extends StatelessWidget {
  const LanguageScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            leadingWidth: 50,
            title:  Text(AppStrings.language.tr(context)!,style: AppTextStyles.get18BoldText(),),
          ),
          body: const BuildLanguageScreenBody()
      ),
    );
  }
}