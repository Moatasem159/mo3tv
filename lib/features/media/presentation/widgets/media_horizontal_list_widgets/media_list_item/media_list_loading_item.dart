import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class MediaListLoadingItem extends StatelessWidget {
  const MediaListLoadingItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        width: 120,
        height:200,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
      ),
    );
  }
}