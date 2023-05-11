import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieImagePlaceHolder extends StatelessWidget {
  const MovieImagePlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}