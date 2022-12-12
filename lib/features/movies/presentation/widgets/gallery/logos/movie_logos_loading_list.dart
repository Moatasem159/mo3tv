import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieLogosLoadingList extends StatelessWidget {
  const MovieLogosLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
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
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 7),
        ),
      ],
    );
  }
}