import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_body.dart';
class AccountMediaListsScreen extends StatelessWidget {
  final String title;
  final String mediaType;
  final String listType;
  const AccountMediaListsScreen({
    Key? key,
    required this.title,
    required this.mediaType,
    required this.listType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: MediaScreenBody(
          title: title,
          listType: listType,
          mediaType: mediaType,
        ),
      ),
    );
  }
}