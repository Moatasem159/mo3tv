import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LoginAlert extends StatelessWidget {
  const LoginAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('You must login first',style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          child:  Text('ok',style: AppTextStyles.get14NormalText()),
          onPressed: () {Navigator.of(context).pop();},
        ),
      ],
    );
  }
}