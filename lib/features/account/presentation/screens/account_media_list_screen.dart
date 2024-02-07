import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/sliver_loading_indicator.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/media/presentation/widgets/recommendations_media_widgets/sliver_media_loading_list.dart';
part '../widgets/media_screen_body.dart';
part '../widgets/empty_account_list.dart';
part '../widgets/account_media_lists.dart';
part '../widgets/account_lists_appbar.dart';
part '../widgets/account_list_loading.dart';
class AccountMediaListsScreen extends StatelessWidget {
  final String title;
  final String mediaType;
  final String listType;
  const AccountMediaListsScreen({super.key, required this.title, required this.mediaType,required this.listType});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AccountListsCubit(di.sl())..getAccountList(listType: listType, mediaType: mediaType),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: _MediaScreenBody(title: title, listType: listType, mediaType: mediaType),
        ),
      ),
    );
  }
}