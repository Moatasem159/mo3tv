import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_app_bar_widgets/account_appbar.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_movies_lists.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_tv_shows_lists.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountAppBar(),
          const AccountMovieLists(),
          const AccountTvShowLists(),
          Text(AppStrings.yourLists.tr(context)!,style: AppTextStyles.get25BoldText()).addSymmetricPadding(h:20),
        ],
      ),
    );
  }
}

