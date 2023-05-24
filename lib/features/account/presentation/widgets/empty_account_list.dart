import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class EmptyAccountList extends StatelessWidget {
  final String type;
  const EmptyAccountList({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.sentiment_dissatisfied_rounded,size: 150),
          10.ph,
           Text("No $type",style: AppTextStyles.get18BoldText()),
          10.ph,
           Text("Try add some",style: AppTextStyles.get14NormalText()),
        ],
      ),
    );
  }
}