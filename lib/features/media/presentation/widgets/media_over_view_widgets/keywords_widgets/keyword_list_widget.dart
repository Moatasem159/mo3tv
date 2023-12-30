import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/features/media/domain/entities/keyword.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/keywords_widgets/keyword_widget.dart';
class KeywordListWidget extends StatelessWidget {
  final List<Keyword> keywords;
  const KeywordListWidget({super.key, required this.keywords});
  @override
  Widget build(BuildContext context) {
    if(keywords.isNotEmpty)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${AppStrings.keywords.tr(context)!}:",style:AppTextStyles.get14BoldText()).addSymmetricPadding(h: 10),
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