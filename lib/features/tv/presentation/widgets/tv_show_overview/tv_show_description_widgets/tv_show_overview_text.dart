import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class TvShowOverviewText extends StatelessWidget {
  final String overview;
  const TvShowOverviewText({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(overview,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14NormalText():AppTextStyles.get18BoldText()),
        5.ph,
      ],
    ).addSymmetricPadding(h: 10);
  }
}