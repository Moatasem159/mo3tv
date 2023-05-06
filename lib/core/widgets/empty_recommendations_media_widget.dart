import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class RecommendationsMediaEmptyWidget extends StatelessWidget {
  final IconData icon;
  final String msg;
  const RecommendationsMediaEmptyWidget({Key? key, required this.icon, required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            Icon(icon,size: 70),
            10.ph,
            Text(msg,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600))
          ],
        ),
    );
  }
}