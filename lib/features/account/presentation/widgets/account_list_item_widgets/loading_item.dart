import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        margin: const EdgeInsets.all(10),
        height:200,
        width: 400,
        decoration: BoxDecoration(
          color:Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}