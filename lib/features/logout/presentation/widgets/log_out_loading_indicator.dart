import 'package:flutter/material.dart';
class LogOutLoadingIndicator extends StatelessWidget {
  const LogOutLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: const EdgeInsets.all(15),
      height: 30,
      child: const CircularProgressIndicator(strokeWidth: 1));
  }
}