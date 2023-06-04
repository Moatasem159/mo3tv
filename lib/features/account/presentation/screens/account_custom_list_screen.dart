import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_custom_list_screen_widgets/account_custom_list_screen_body.dart';
class AccountCustomListScreen extends StatelessWidget {
  final AccountCustomMediaList listInfo;
  const AccountCustomListScreen({super.key, required this.listInfo});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AccountCustomListCubit>()
        ..getAccountCustomList(
            listId: listInfo.id!, sessionId: AppStrings.sessionId),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: AccountCustomListScreenBody(listInfo: listInfo),
        ),
      ),
    );
  }
}