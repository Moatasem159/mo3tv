part of'movie_info_widget.dart';
class _BudgetWidget extends StatelessWidget {
  final num budget;
  final num revenue;
  const _BudgetWidget({required this.budget, required this.revenue});
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