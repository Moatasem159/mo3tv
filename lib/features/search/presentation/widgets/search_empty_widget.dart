import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
         child: Text(
           "No Results",
           style: AppTextStyles.get18BoldText())),
    );
  }
}