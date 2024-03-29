import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:mo3tv/features/settings/presentation/widgets/language_screen_widgets/change_language_dialog.dart';
import 'package:mo3tv/core/widgets/custom_list_tile.dart';
class BuildLanguageScreenBody extends StatelessWidget {
  const BuildLanguageScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: AppStrings.englishLang,
          icon: Icons.language_outlined,
          onTap: () {
            if (!AppLocalizations.of(context)!.isEnLocale) {
              showAdaptiveDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return ChangeLanguageDialog(
                    onTap: () {
                      if (!AppLocalizations.of(context)!.isEnLocale) {
                        LocaleCubit.get(context).toEnglish();
                      }
                    },
                  );
                },
              );
            }
          },
        ),
        CustomListTile(
          title: AppStrings.arabicLang,
          icon: Icons.language_outlined,
          onTap: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              showAdaptiveDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return ChangeLanguageDialog(
                    onTap: () {
                      if (AppLocalizations.of(context)!.isEnLocale) {
                        LocaleCubit.get(context).toArabic();
                      }
                    },
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}