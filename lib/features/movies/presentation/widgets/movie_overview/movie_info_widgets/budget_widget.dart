import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class BudgetWidget extends StatelessWidget {
  final num budget;
  final num revenue;
  const BudgetWidget({super.key, required this.budget, required this.revenue});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.budget.tr(context)!, style: AppTextStyles.get14BoldText()),
        Text(budget != 0 ? "\$ ${myFormat.format(budget)}" : "------",
            style: AppTextStyles.get14NormalText()),
        Text(AppStrings.revenue.tr(context)!, style: AppTextStyles.get14BoldText()),
        Text(revenue != 0 ? "\$ ${myFormat.format(revenue)}" : "------",
            style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}