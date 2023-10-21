import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final String label;
  final Size size;
  final double radius;
  const MainButton({super.key, required this.onPressed, required this.label,
    this.size=const Size(130,40),this.radius=10});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(radius),
          )),
          fixedSize: MaterialStateProperty.all(size)
      ),
      onPressed:onPressed,
      child: Text(label,
        style: AppTextStyles.get14NormalText(height: 0)),
    );
  }
}