import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class GalleryTabBar extends StatelessWidget {
  final ValueChanged<int>? onTap;
  const GalleryTabBar({Key? key,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 10,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize:  Size(0,AppLocalizations.of(context)!.isEnLocale?35:40),
        child: TabBar(
          indicatorWeight: 2,
          indicatorColor: Colors.red,
          labelPadding: const EdgeInsets.only(bottom: 5),
          onTap: onTap,
          tabs:  [
            Text(AppStrings.backdrops.tr(context)!,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
            Text(AppStrings.posters.tr(context)!,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
            Text(AppStrings.logos.tr(context)!,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
          ],
        ),
      ),
    );
  }
}
