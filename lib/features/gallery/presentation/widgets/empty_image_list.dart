import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class EmptyImageList extends StatelessWidget {
  final String text;
  const EmptyImageList({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        const Icon(Icons.image_not_supported_outlined, size: 100),
        Text(text, style: const TextStyle(fontSize: 25)),
      ],
    );
  }
}