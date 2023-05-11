import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';
class TvShowKeywords extends StatelessWidget {
  final List<Keyword> keywords;
  const TvShowKeywords({super.key,required this.keywords});
  @override
  Widget build(BuildContext context) {
    if (keywords.isNotEmpty) {
      return Column(
        children: [
          KeywordListWidget(keywords: keywords),
          7.ph,
        ],
      );
    }
    return Container();
  }
}