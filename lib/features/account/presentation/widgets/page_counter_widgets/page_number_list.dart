import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/widgets/page_counter_widgets/page_button.dart';

class PageNumbersList extends StatelessWidget {
  final int page;
  final int totalPage;
  final String listType;
  final String mediaType;
  const PageNumbersList({
    super.key,
    required this.listType,
    required this.mediaType,
    required this.page,
    required this.totalPage,
  });

  List<Widget> _generatePageWidgets(int totalPage, int currentPage, String listType, String mediaType,context) {
    if (totalPage <= 5) {
      return List.generate(totalPage, (index) => PageButton(page: index+1,currentPage: currentPage,listType:  listType, mediaType:mediaType));
    } else {
      final List<Widget> pageWidgets = [];
      int startPage = currentPage - 2;
      int endPage = currentPage + 2;
      if (startPage < 1) {
        startPage = 1;
        endPage = 5;
      } else if (endPage > totalPage) {
        endPage = totalPage;
        startPage = totalPage - 4;
      }
      for (int page = startPage; page <= endPage; page++) {
        pageWidgets.add(PageButton(page: page,currentPage: currentPage,listType:  listType, mediaType:mediaType));
      }
      return pageWidgets;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        5.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  if(page!=1) {
                    AccountListsCubit.get(context).getAccountList(listType: listType, mediaType: mediaType,page: 1,lang: AppLocalizations.of(context)!.getLang());
                  }
                },
                child: Text("<<", style: AppTextStyles.get18BoldText())),
            10.pw,
            Row(
              children: _generatePageWidgets(totalPage, page, listType, mediaType,context),
            ),
            10.pw,
            GestureDetector(
                onTap: () {
                  if(totalPage!=page) {
                    AccountListsCubit.get(context).getAccountList(listType: listType, mediaType: mediaType,page: totalPage,lang: AppLocalizations.of(context)!.getLang());
                  }
                },
                child: Text(">>", style: AppTextStyles.get18BoldText())),
          ],
        ),
        5.ph
      ],
    );
  }
}