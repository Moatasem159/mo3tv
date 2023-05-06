import 'package:flutter/material.dart';
class LoginAlert extends StatelessWidget {
  const LoginAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('You must login first'),
      actions: [
        TextButton(
          child: const Text('ok'),
          onPressed: () {Navigator.of(context).pop();},
        ),
      ],
    );
  }
}