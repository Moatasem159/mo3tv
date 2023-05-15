import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final String label;
  final Size size;
  final double radius;
  const MainButton({Key? key, required this.onPressed, required this.label,
    this.size=const Size(130,40),this.radius=10}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(radius),
          )),
          fixedSize: MaterialStateProperty.all(size)
      ),
      onPressed:onPressed,
      child: Text(label,style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),),
    );

  }
}