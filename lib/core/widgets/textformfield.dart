import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class MainTextFormField extends StatelessWidget {
  final String ?hintText;
  final IconData ?prefixIcon;
  final TextEditingController ?controller;
  final String? Function(String ?value)? validator;
  final Widget? suffixIcon;
  final Color focusedErrorBorderColor = Colors.red;
  final Color focusedBorderColor;
  final TextInputType? inputType;
  final ValueChanged<String>? onChange;
  const MainTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.focusedBorderColor=Colors.white,
    this.inputType,
    this.onChange});
  @override
  Widget build(BuildContext context) {
    double radius = 7;
    return TextFormField(
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      onChanged: onChange,
      cursorColor: Theme.of(context).primaryColorLight,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 7),
        suffixIcon: suffixIcon,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: focusedErrorBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: focusedErrorBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        hintText: hintText,
        hintStyle:AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get10NormalText():AppTextStyles.get14NormalText(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: focusedBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,

                color:Theme.of(context).primaryColorLight
            ),
            borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).textTheme.titleMedium!.color,
        ),
      ),
    ).addPadding(t:5,l: 15,r:15);
  }
}