import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class SliverMediaLoadingList extends StatelessWidget {
  const SliverMediaLoadingList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate:
      SliverChildBuilderDelegate(childCount: 6, (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Shimmer.fromColors(
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
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .69, crossAxisCount: 3, mainAxisSpacing: 7),
    );
  }
}