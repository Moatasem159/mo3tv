import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
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
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
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

class MediaIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;
  const MediaIconButton({Key? key, required this.icon, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(45, 45)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[900])),
        onPressed: onTap,
        child: icon);
  }
}


class ErrorButton extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorButton({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Something went wrong"),
        7.ph,
        MainButton(onPressed:onTap, label: "try again")
      ],
    );
  }
}