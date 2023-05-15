import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class ImageListTitle extends StatelessWidget {
  final String title;
  final int length;
  const ImageListTitle({super.key, required this.title, required this.length});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text(
              "$title:$length",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          10.ph
        ],
      ),
    );
  }
}