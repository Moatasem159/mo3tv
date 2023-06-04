import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_lists_widgets/account_custom_lists_list.dart';
class AccountCustomListSuccessBody extends StatelessWidget {
  final List<AccountCustomMediaList> items;
  const AccountCustomListSuccessBody({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.yourLists.tr(context)!,style: AppTextStyles.get25BoldText()),
        10.ph,
        AccountCustomListsList(items:items),
        10.ph,
      ],
    ).addSymmetricPadding(h: 20);
  }
}