import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_lists_widgets/account_custom_list_success_body.dart';
class AccountCustomLists extends StatelessWidget {
  const AccountCustomLists({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!AccountCustomListsCubit.get(context).isSuccess()) {
        AccountCustomListsCubit.get(context).getAccountCustomLists(
            sessionId: AppStrings.sessionId, accountId: AppStrings.accountId);
      }
      return BlocBuilder<AccountCustomListsCubit, AccountCustomListsStates>(
        builder: (context, state) {
          if (state is GetAccountCustomListsSuccessState) {
            return AccountCustomListSuccessBody(items:state.list);
          }
          return Container();
        },
      );
    });
  }
}