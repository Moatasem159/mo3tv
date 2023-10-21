import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_loading.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_widget.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    if(AppStrings.sessionId!="") {
      return BlocProvider(
      create: (context) => AccountCubit(di.sl())..getAccountDetails(),
      child: BlocBuilder<AccountCubit, AccountStates>(
        builder: (context, state) {
          if (state is GetAccountsDetailsLoadingState) {
            return const AccountAppBarLoadingWidget();
          }
          if (state is GetAccountsDetailsSuccessState) {
            return AccountAppBarWidget(account: state.account);
          }
          return Container();
        },
      ),
    );
    }
    return Container();
  }
}