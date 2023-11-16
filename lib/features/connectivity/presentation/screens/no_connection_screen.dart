import 'package:flutter/material.dart';
import 'package:mo3tv/features/connectivity/presentation/widgets/no_connection_screen_body.dart';
class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
     canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const NoConnectionScreenBody(),
        ),
      ),
    );
  }
}