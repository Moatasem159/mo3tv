import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:mo3tv/features/settings/presentation/widgets/settings_tile.dart';
class BuildLanguageScreenBody extends StatelessWidget {
  const BuildLanguageScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          title: AppStrings.englishLang,
          icon: FontAwesomeIcons.language,
          onTap: () {
            if (!AppLocalizations.of(context)!.isEnLocale) {
              LocaleCubit.get(context).toEnglish();
            }
          },
        ),
        SettingsTile(
          title: AppStrings.arabicLang,
          icon: FontAwesomeIcons.language,
          onTap: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              LocaleCubit.get(context).toArabic();
            }
          },
        ),
      ],
    );
  }
}