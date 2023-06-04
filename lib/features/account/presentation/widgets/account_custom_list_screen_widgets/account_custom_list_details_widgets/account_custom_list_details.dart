import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/account_custom_list_details_widgets/clear_list_button.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/account_custom_list_details_widgets/list_count_widget.dart';
class AccountCustomListDetails extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const AccountCustomListDetails({super.key,required this.listInfo});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(listInfo.description!='')
          Text(listInfo.description!,style: AppTextStyles.get18BoldText()),
          ListCountWidget(listInfo: listInfo),
          Row(
            children: [
              Text(AppStrings.deleteList.tr(context)!,style: AppTextStyles.get18BoldText(color: Colors.red)),
              const Spacer(),
              ClearCustomListButton(listInfo: listInfo)
            ],
          ).addAllPadding(8),
        ],
      ).addAllPadding(10),
    );
  }
}