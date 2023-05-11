import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class RevenueWidget extends StatelessWidget {
  final num revenue;
  const RevenueWidget({super.key,required this.revenue});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Revenue",
            style: TextStyle(fontWeight: FontWeight.bold)),
        if (revenue != 0) 5.ph,
        Text(revenue != 0
            ? "\$ ${myFormat.format(revenue)}"
            : "------"),
      ],
    );
  }
}