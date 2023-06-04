import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/account_custom_list_items_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCustomListCubit, AccountCustomListStates>(
      builder: (context, state) {
        AccountCustomListCubit cubit = AccountCustomListCubit.get(context);
        if(state is GetAccountCustomListLoadingState)
        {
          return const SliverMediaLoadingList();
        }
        if(state is GetAccountCustomListSuccessState &&cubit.list!.items!.isEmpty) {
          return const EmptyAccountList(type:AppStrings.noItems);
        }
        if (state is GetAccountCustomListSuccessState) {
          return AccountCustomListItemsList(items:cubit.list!.items);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}