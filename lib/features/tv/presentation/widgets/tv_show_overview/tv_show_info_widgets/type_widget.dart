import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';

class TypeWidget extends StatelessWidget {
  final String type;
  const TypeWidget({super.key,required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Type",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        4.ph,
        Text(type),
        7.ph,
      ],
    );
  }
}
