import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class BudgetWidget extends StatelessWidget {
  final num budget;
  const BudgetWidget({super.key, required this.budget});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Budget",
            style: TextStyle(fontWeight: FontWeight.bold)),
        if (budget != 0) 5.ph,
        Text(budget != 0
            ? "\$ ${myFormat.format(budget)}"
            : "------"),
        7.ph,
      ],
    );
  }
}