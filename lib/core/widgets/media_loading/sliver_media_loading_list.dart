import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:shimmer/shimmer.dart';
class SliverMediaLoadingList extends StatelessWidget {
  const SliverMediaLoadingList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .69, crossAxisCount: 3, mainAxisSpacing: 7),
      delegate:
      SliverChildBuilderDelegate(
          childCount: 12,
          (context, index) =>Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          height: 170.0,
          width: 115.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).addSymmetricPadding(h:5)));
  }
}