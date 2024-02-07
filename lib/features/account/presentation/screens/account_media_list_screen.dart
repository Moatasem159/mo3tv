import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_body.dart';
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
          body: MediaScreenBody(title: title, listType: listType, mediaType: mediaType),
        ),
      ),
    );
  }
}