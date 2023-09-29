import 'package:flutter/material.dart';
class ArrowUpButton extends StatelessWidget {
  final VoidCallback onTap;
  const ArrowUpButton({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        onPressed: onTap,
        child: const Icon(Icons.arrow_upward_outlined),
      ),
    );
  }
}