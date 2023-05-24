import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class SeeMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SeeMoreButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onPressed,
            child:Text("Load more",style: AppTextStyles.get14BoldText())
        ),
      ),
    );
  }
}