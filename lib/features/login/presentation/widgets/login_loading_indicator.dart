import 'package:flutter/material.dart';
class LoginLoadingIndicator extends StatelessWidget{
  const LoginLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width:40,
        height:40,
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor, strokeWidth: 1)),
    );
  }
}