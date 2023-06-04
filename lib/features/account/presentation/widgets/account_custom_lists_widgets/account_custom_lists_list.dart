import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_lists_widgets/account_custom_list_item.dart';
class AccountCustomListsList extends StatelessWidget {
  final List<AccountCustomMediaList> items;
  const AccountCustomListsList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) =>AccountCustomListItem(item: items[index]));
  }
}