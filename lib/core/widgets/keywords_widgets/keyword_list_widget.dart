import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_widget.dart';
class KeywordListWidget extends StatelessWidget {
  final List<Keyword> keywords;
  const KeywordListWidget({Key? key, required this.keywords}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(keywords.isNotEmpty)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("${AppStrings.keywords.tr(context)!}:",style:AppTextStyles.get14BoldText())),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: keywords.map((e)=>KeywordWidget(keyword: e)).toList(),
            ),
          ],
        );
      }
    return Container();
  }
}