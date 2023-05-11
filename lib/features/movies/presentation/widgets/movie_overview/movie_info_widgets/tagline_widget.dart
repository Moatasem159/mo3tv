import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class TaglineWidget extends StatelessWidget {
  final String tagline;
  const TaglineWidget({super.key,required this.tagline});
  @override
  Widget build(BuildContext context) {
    if (tagline != "") {
      return Column(
        children: [
          5.ph,
          Text(tagline,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ],
      );
    }
    return Container();
  }
}