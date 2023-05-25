import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_appbar.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_movies_lists.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_tv_shows_lists.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_button.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(AppStrings.sessionId!='')
    {
      return const CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          AccountAppBar(),
          AccountMovieLists(),
          AccountTvShowLists(),
        ],
      );
    }
    if(AppStrings.sessionId=='')
      {
       return const LoginButton();
      }
    return Container();
  }
}