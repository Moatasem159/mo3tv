import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class ToastWidget extends StatelessWidget {
  final String msg;
  const ToastWidget({Key? key,required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Colors.black),
      child: Text(msg, style: AppTextStyles.get14NormalText(height: 1)),
    );
  }
}