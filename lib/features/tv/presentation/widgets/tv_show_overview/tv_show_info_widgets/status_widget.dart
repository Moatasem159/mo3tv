import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class StatusWidget extends StatelessWidget {
  final String status;
  const StatusWidget({super.key, required this.status,});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Status",style: TextStyle(fontWeight: FontWeight.bold)),
        4.ph,
        Text(status),
        6.ph,
      ],
    );
  }
}