import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:shimmer/shimmer.dart';
class InfoLoadingWidget extends StatelessWidget {
  const InfoLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              width: 150,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            )),
        10.ph,
      ],
    );
  }
}