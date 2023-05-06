import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class MediaPosterLoading extends StatelessWidget {
  const MediaPosterLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: 250,
          height:350,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}