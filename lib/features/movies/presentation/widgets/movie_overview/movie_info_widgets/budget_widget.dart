import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class BudgetWidget extends StatelessWidget {
  final num budget;
  const BudgetWidget({super.key, required this.budget});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Budget", style: AppTextStyles.get14BoldText()),
        Text(budget != 0 ? "\$ ${myFormat.format(budget)}" : "------",
            style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}