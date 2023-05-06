import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class SeeMoreLoadingIndicator extends StatelessWidget {
  const SeeMoreLoadingIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            5.ph,
            const SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
            5.ph,
          ],
        ),
      ),
    );
  }
}