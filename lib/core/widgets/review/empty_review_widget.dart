import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class ReviewEmptyWidget extends StatelessWidget {
  final String msg;
  const ReviewEmptyWidget({Key? key, required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            const Icon(Icons.comments_disabled_outlined, size: 70),
            10.ph,
            Text(msg, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600))
          ],
        ),
    );
  }
}