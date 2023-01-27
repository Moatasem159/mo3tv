import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_widget.dart';

class KeywordListWidget extends StatelessWidget {
  final List<Keyword> keywords;
  const KeywordListWidget({Key? key, required this.keywords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Keywords:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 7,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: keywords.map((e) {
            return KeywordWidget(keyword: e,);
          }).toList(),
        ),
      ],
    );
  }
}