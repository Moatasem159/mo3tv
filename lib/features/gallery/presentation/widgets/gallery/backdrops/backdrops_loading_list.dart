import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class BackdropsLoadingList extends StatelessWidget {
  const BackdropsLoadingList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount:10,
                (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[600]!,
                child: Container(
                  color: Colors.grey,
                ),
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 7),
        ),
      ],
    );
  }
}