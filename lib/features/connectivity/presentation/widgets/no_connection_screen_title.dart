import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class NoConnectionScreenTitle extends StatelessWidget {
  const NoConnectionScreenTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.wifi_off_rounded, size: 200, color: Theme.of(context).primaryColor),
        Text(
          AppStrings.noConnectionMsg.tr(context)!,
          style: AppTextStyles.get14BoldText(height: 1.7),
          textAlign: TextAlign.center,
        ).addSymmetricPadding(h: MediaQuery.sizeOf(context).width / 7.7),
        20.ph,
      ],
    );
  }
}