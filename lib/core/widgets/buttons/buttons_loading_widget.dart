import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/buttons/loading_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
class ButtonsLoadingWidget extends StatelessWidget {
  const ButtonsLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircularPercentIndicator(radius: 21, lineWidth: 3),
                    5.pw,
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User"),
                        Text("Score"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const LoadingButton(),
            const LoadingButton(),
            const LoadingButton(),
          ],
        ),
      ],
    );
  }
}