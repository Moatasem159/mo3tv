import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LoginButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const LoginButtonWidget({Key? key, required this.title, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
      onPressed: onTap,
      child:Text(title,style: AppTextStyles.get14NormalText()),
    );
  }
}