import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_loading.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widget.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit,AccountStates>(
        listener: (context, state) {},
      builder: (context, state) {
        AccountCubit cubit =BlocProvider.of<AccountCubit>(context);
        if(cubit.account!=null){
          return AccountAppBarWidget(account: cubit.account!);
        }
        if(cubit.account==null){
          return const AccountAppBarLoadingWidget();
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}
