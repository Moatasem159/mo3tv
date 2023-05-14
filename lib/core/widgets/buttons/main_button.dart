import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final String label;
  const MainButton({Key? key, required this.onPressed, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10),
          )),
          fixedSize: MaterialStateProperty.all(const Size(130, 40))
      ),
      onPressed:onPressed,
      child: Text(label,style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),),
    );

  }
}