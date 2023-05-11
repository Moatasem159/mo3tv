import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:shimmer/shimmer.dart';

class DescriptionLoading extends StatelessWidget {
  const DescriptionLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5)
            ),
            height: 20,),
        ),
      ],
    );
  }
}