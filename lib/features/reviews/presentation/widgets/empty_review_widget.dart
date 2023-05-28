import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class ReviewEmptyWidget extends StatelessWidget {
  final String msg;
  const ReviewEmptyWidget({Key? key, required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            const Icon(Icons.comments_disabled_outlined, size: 70),
            Text(msg.tr(context)!, style: AppTextStyles.get25BoldText())
          ],
        ),
    );
  }
}