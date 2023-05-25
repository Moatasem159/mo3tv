import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';

class PageButton extends StatelessWidget {
  final int page;
  final int currentPage;
  final String listType;
  final String mediaType;
  const PageButton(
      {Key? key,
        required this.page,
        required this.currentPage,
        required this.listType,
        required this.mediaType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = page == currentPage;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {
          if (!isActive) {
            AccountListsCubit.get(context).getAccountList(listType: listType, mediaType: mediaType,page: page);
          }
        },
        child: Text(
          "$page",
          style: isActive ? AppTextStyles.get18BoldText().copyWith(color:Theme.of(context).primaryColor) : AppTextStyles.get18BoldText(),
        ),
      ),
    );
  }
}
