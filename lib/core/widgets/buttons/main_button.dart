import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final String label;
  final Size ?size;
  final double ?radius;
  final Color ?color;
  final TextStyle ?textStyle;
  final Color ?overlayColor;
  const MainButton({super.key, required this.onPressed, required this.label,
    this.size=const Size(130,40),this.radius=10, this.color, this.overlayColor, this.textStyle});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(overlayColor),
        backgroundColor:MaterialStateProperty.all<Color?>(color),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(radius!),
          )),
        fixedSize: MaterialStateProperty.all(size),
        minimumSize: MaterialStateProperty.all(Size.zero),

      ),
      onPressed:onPressed,
      child: Text(label,
        style: textStyle??AppTextStyles.get14NormalText(height: 0)),
    );
  }
}