import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_appbar.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_movies_lists.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_tv_shows_lists.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountAppBar(),
          AccountMovieLists(),
          AccountTvShowLists(),
        ],
      ),
    );
  }
}