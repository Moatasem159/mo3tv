import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/account_custom_list_details.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/items_list_widget.dart';
class AccountCustomListScreenBody extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const AccountCustomListScreenBody({super.key,required this.listInfo});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: listInfo.name!,onPressed: () => GoRouter.of(context).pop()),
        AccountCustomListDetails(listInfo: listInfo),
        const ItemsListWidget()
      ],
    );
  }
}