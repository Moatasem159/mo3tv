import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_loading.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_widget.dart';
class AccountAppBar extends StatelessWidget {
  const AccountAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,AccountStates>(
      builder: (context, state){
        if(state is GetAccountsDetailsLoadingState){
          return const AccountAppBarLoadingWidget();
        }
        if(state is GetAccountsDetailsSuccessState)
          {
            return  AccountAppBarWidget(account: state.account);
          }
        return const SliverToBoxAdapter();
      },
    );
  }
}