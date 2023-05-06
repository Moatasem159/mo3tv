import 'package:flutter/material.dart';
class LoginLoadingIndicator extends StatelessWidget{
  const LoginLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width:60,
      height:60,
      child: CircularProgressIndicator(
        color: Colors.red,
        strokeWidth: 1,
      ),
    );
  }
}