import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/widgets/read_more_widget.dart';
class TvShowOverviewText extends StatelessWidget {
  final String overview;
  const TvShowOverviewText({super.key,required this.overview});
  @override
  Widget build(BuildContext context) {
    return ReadMoreWidget(content: overview).addSymmetricPadding(h: 10,v:5);
  }
}