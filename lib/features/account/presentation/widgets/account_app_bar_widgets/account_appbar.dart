import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_loading.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_app_bar_widget.dart';
class AccountAppBar extends StatelessWidget {
  const AccountAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if(!AccountCubit.get(context).isSuccess())
          {
            AccountCubit.get(context).getAccountDetails(sessionId: AppStrings.sessionId);
          }
        return BlocBuilder<AccountCubit,AccountStates>(
          builder: (context, state){
            if(state is GetAccountsDetailsLoadingState){
              return const AccountAppBarLoadingWidget();
            }
            if(state is GetAccountsDetailsSuccessState)
              {
                AppStrings.accountId=state.account.id.toString();
                return  AccountAppBarWidget(account: state.account);
              }
            return  Container();
          },
        );
      }
    );
  }
}