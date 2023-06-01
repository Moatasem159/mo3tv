import 'package:flutter/widgets.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class OverViewWidget extends StatelessWidget {
  final String overview;
  const OverViewWidget({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.ph,
        Text(overview,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14NormalText():AppTextStyles.get18NormalText()),
        5.ph,
      ],
    ).addSymmetricPadding(h: 10);
  }
}