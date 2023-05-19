import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';
class TvShowKeywords extends StatelessWidget {
  final List<Keyword> keywords;
  const TvShowKeywords({super.key,required this.keywords});
  @override
  Widget build(BuildContext context) {
    if (keywords.isNotEmpty) {
      return KeywordListWidget(keywords: keywords);
    }
    return Container();
  }
}