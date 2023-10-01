import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children:  [
          5.ph,
          const SizedBox(
            height: 35,
            width: 35,
            child: CircularProgressIndicator(
              strokeWidth: 1.1,
            ),
          ),
          5.ph,
        ],
      ).addAllPadding(8),
    );
  }
}