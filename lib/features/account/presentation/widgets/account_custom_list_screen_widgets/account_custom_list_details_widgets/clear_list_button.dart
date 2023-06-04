import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_action_bloc/account_custom_list_action_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_action_bloc/account_custom_list_action_event.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_action_bloc/account_custom_list_action_state.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_state.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_cubit.dart';
class ClearCustomListButton extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const ClearCustomListButton({super.key, required this.listInfo});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCustomListActionBloc,
        AccountCustomListActionStates>(
      listener: (context, state) {
        AccountCustomListsCubit.get(context).getAccountCustomLists(
            sessionId: AppStrings.sessionId, accountId: AppStrings.accountId);
        AccountCustomListCubit.get(context).clearList();
      },
      child: BlocBuilder<AccountCustomListCubit, AccountCustomListStates>(
        builder: (context, state) {
          if (AccountCustomListCubit.get(context).list!.itemCount != null &&
              AccountCustomListCubit.get(context).list!.itemCount != 0) {
            return GestureDetector(
                onTap: () {
                  AccountCustomListActionBloc.get(context)
                      .add(ClearListEvent(listInfo.id!));
                },
                child: Text(AppStrings.clearList.tr(context)!,
                    style: AppTextStyles.get18BoldText(color: Colors.green)));
          }
          return Container();
        },
      ),
    );
  }
}