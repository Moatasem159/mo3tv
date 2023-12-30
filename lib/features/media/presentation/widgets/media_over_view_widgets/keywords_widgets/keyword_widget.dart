import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/domain/entities/keyword.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class KeywordWidget extends StatelessWidget {
  final Keyword keyword;
  const KeywordWidget({super.key, required this.keyword});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black38.withOpacity(.5),
            borderRadius: BorderRadius.circular(5)),
        child: Text(keyword.name,style:AppTextStyles.get14NormalText()));
  }
}