import 'package:flutter/material.dart';
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: const EdgeInsets.all(15),
      height: 30,
      child: CircularProgressIndicator(strokeWidth: 1,color: Theme.of(context).primaryColor));
  }
}