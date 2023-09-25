import 'package:flutter/material.dart';
import 'package:mo3tv/features/connectivity/presentation/widgets/no_connection_screen_title.dart';
import 'package:mo3tv/features/connectivity/presentation/widgets/try_again_button.dart';
class NoConnectionScreenBody extends StatelessWidget {
  const NoConnectionScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NoConnectionScreenTitle(),
        TryAgainButton()
      ],
    );
  }
}