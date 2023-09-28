import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class TvShowImagePlaceHolder extends StatelessWidget {
  const TvShowImagePlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8.0))));
  }
}