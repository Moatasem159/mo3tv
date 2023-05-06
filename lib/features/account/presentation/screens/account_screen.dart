import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_appbar.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_button.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(AppStrings.sessionId!='')
    {
      return NestedScrollView(
        headerSliverBuilder:(context, innerBoxIsScrolled)
        {
          return [
            const AccountAppBar(),
          ];
        },
        body:const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [AccountLists()],
        )
      );
    }
    if(AppStrings.sessionId=='')
      {
       return const LoginButton();
      }
    return Container();
  }
}