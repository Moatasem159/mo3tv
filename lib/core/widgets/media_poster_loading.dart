import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MediaPosterLoading extends StatelessWidget {


  const MediaPosterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        height: 170.0,
        width: 115.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
