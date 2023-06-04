import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class CustomAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomAppBar({Key? key, required this.onPressed, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 50,
      toolbarHeight: 50,
      leading:IconButton(onPressed: onPressed,
          icon: const Icon(Icons.arrow_back,size: 20)),
      title: Text(title,style: AppTextStyles.get14BoldText()),
      snap: true,
      floating: true,
      stretch: true,
    );
  }
}