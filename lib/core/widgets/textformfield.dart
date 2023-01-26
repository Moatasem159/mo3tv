import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {

  final String hintText;
  final IconData ?prefixIcon;
  final TextEditingController ?controller;
  final String? Function(String ?value)? validator;
  final Widget? suffixIcon;
  final Color focusedErrorBorderColor = Colors.red;
  final Color focusedBorderColor;
  final TextInputType? inputType;
  final ValueChanged<String>? onChange;

  const MainTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    required this.focusedBorderColor,
    this.inputType, this.onChange}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double radius = 7;
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
      child: TextFormField(
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

          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 11
          ),
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
      ),
    );
  }
}