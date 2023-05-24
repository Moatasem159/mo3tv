import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class StatusWidget extends StatelessWidget {
  final String status;
  const StatusWidget({super.key, required this.status,});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Status",style:AppTextStyles.get14BoldText()),
        Text(status,style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}