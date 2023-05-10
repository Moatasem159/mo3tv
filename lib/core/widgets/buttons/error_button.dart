import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
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
        const Text("Something went wrong"),
        7.ph,
        MainButton(onPressed:onTap, label: "try again")
      ],
    );
  }
}