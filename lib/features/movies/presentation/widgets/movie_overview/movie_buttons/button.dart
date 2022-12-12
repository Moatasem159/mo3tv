import 'package:flutter/material.dart';

class MovieButton extends StatelessWidget {

  final Icon icon;
  final VoidCallback onTap;
  const MovieButton({Key? key, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(45, 45)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
        onPressed: onTap,
        child: icon);
  }
}
