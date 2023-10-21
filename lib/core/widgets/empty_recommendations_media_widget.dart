import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class RecommendationsMediaEmptyWidget extends StatelessWidget {
  final IconData icon;
  final String msg;
  const RecommendationsMediaEmptyWidget({super.key, required this.icon, required this.msg});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            Icon(icon,size: 70),
            Text(msg.tr(context)!,style: AppTextStyles.get25BoldText())
          ],
        ),
    );
  }
}