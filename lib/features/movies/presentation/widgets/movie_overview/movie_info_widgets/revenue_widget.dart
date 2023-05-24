import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class RevenueWidget extends StatelessWidget {
  final num revenue;
  const RevenueWidget({super.key, required this.revenue});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Revenue", style: AppTextStyles.get14BoldText()),
        Text(revenue != 0 ? "\$ ${myFormat.format(revenue)}" : "------",
            style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}