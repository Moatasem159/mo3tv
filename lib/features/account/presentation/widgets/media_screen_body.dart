import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/account_items_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/page_counter_widgets/page_counter_widget.dart';
class MediaScreenBody extends StatelessWidget {
  final String title;
  final String mediaType;
  final String listType;
  const MediaScreenBody({
    super.key,
    required this.title,
    required this.mediaType,
    required this.listType});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: title.tr(context)!,onPressed:(){
          AccountListsCubit.get(context).totalPage=-1;
          AccountListsCubit.get(context).totalResult=-1;
          GoRouter.of(context).pop();
        }),
        SliverToBoxAdapter(child: 7.ph),
        AccountList(listType: listType,mediaType: mediaType),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: PageCounterWidget(listType: listType, mediaType: mediaType),
          ),
        ),
      ],
    );
  }
}