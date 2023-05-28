import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class ListTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ListTitle({Key? key, required this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr(context)!,style:AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
          if(onPressed!=null)
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.seeMore.tr(context)!,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(Icons.arrow_forward_ios, size: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}