import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlayingNowMediaLoadingWidget extends StatelessWidget {


  final double height;
  final double width;

  const PlayingNowMediaLoadingWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        color: Colors.grey,
        height: height,
        width: width,

      ),
    );
  }
}