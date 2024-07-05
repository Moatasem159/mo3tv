import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Size? size;
  final double? radius;
  final Color? color;
  final TextStyle? textStyle;
  final Color? overlayColor;
  final EdgeInsets? padding;

  const MainButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.size = const Size(130, 40),
      this.radius = 10,
      this.color,
      this.overlayColor,
      this.textStyle,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(overlayColor),
        backgroundColor: WidgetStatePropertyAll(color),
        padding: WidgetStatePropertyAll(padding),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(size),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
      onPressed: onPressed,
      child: Text(label,
          style: textStyle ?? AppTextStyles.get14NormalText(height: 0)),
    );
  }
}