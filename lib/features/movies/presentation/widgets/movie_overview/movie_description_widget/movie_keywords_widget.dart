import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';

class MovieKeywordsWidget extends StatelessWidget {
  const MovieKeywordsWidget({super.key, required this.keywords});
  final List<Keyword> keywords;
  @override
  Widget build(BuildContext context) {
    if (keywords.isNotEmpty) {
      return KeywordListWidget(keywords: keywords);
    }
    return Container();
  }
}