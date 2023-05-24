import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
class ErrorButton extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorButton({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Something went wrong",style: AppTextStyles.get14NormalText()),
        MainButton(onPressed:onTap, label: "try again")
      ],
    );
  }
}