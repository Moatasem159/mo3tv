import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';

class TvShowTagline extends StatelessWidget {
  final String tagline;
  const TvShowTagline({super.key,required this.tagline});
  @override
  Widget build(BuildContext context) {
    if (tagline != "") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.ph,
          Text(tagline,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          5.ph
        ],
      );
    }
    return Container();
  }
}