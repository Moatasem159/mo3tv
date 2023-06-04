import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_state.dart';

class ListCountWidget extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const ListCountWidget({Key ?key, required this.listInfo}) : super(key: key);
  String getItem(context,int count){
    if(count==0)
    {
      return "";
    }
    if(count==1)
    {
      if(!AppLocalizations.of(context)!.isEnLocale) {
        return AppStrings.oneItem.tr(context)!;
      }
      else{
        return "${listInfo.itemCount!} ${AppStrings.oneItem.tr(context)!}";
      }
    }
    if(count==2)
    {
      if(!AppLocalizations.of(context)!.isEnLocale) {
        return AppStrings.twoItems.tr(context)!;
      }
      else{
        return "${listInfo.itemCount!} ${AppStrings.twoItems.tr(context)!}";
      }
    }
    else {
      return "${listInfo.itemCount!} ${AppStrings.items.tr(context)!}";
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCustomListCubit, AccountCustomListStates>(
      builder: (context, state) {
        if(AccountCustomListCubit.get(context).list!.itemCount!=null){
          return Text(
              getItem(context,
                  AccountCustomListCubit.get(context).list!.itemCount!),
              style: AppTextStyles.get18BoldText(height: 0));

        }
        return Container();
      },
    );
  }
}
