import 'package:mo3tv/core/widgets/custom_list_tile.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_alert.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
part '../widgets/account_list_widget.dart';

part '../widgets/account_movies_lists.dart';

part '../widgets/account_tv_shows_lists.dart';

part '../widgets/account_app_bar_widgets/account_appbar.dart';

part '../widgets/account_app_bar_widgets/account_app_bar_widget.dart';

part '../widgets/account_app_bar_widgets/account_app_bar_loading.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const _AccountAppBar(),
        const _AccountMovieLists(),
        const _AccountTvShowLists(),
        CustomListTile(
            title: AppStrings.yourFavGenres,
            icon: Icons.favorite_rounded,
            onTap: (){
              if(AppStrings.sessionId!='') {
                context.pushNamed(Routes.genresRoute);
              }
              else{
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return const LoginAlert();
                  },
                );
              }
            })
      ],
    );
  }
}
