import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
class AccountCustomListDetails extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const AccountCustomListDetails({super.key,required this.listInfo});
  String getItem(context,int count){
    if(count==1)
    {
      return AppStrings.oneItem.tr(context)!;
    }
    if(count==2)
    {
      return AppStrings.twoItems.tr(context)!;
    }
    else {
      return "${listInfo.itemCount!} ${AppStrings.items.tr(context)!}";
    }
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(listInfo.description!,style: AppTextStyles.get18BoldText()),
          if(listInfo.itemCount!!=0)
            Text(getItem(context, listInfo.itemCount!),
                style: AppTextStyles.get18BoldText()),
          Row(
            children: [
              Text(AppStrings.deleteList.tr(context)!,style: AppTextStyles.get18BoldText(color: Colors.red)),
              const Spacer(),
              Text(AppStrings.clearList.tr(context)!,style: AppTextStyles.get18BoldText(color: Colors.green))
            ],
          ).addAllPadding(8),
        ],
      ).addAllPadding(10),
    );
  }
}