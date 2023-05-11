import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String releaseDate;
  const TitleWidget({super.key, required this.title, required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Text(
        "$title ${releaseDate == "" ? '' : ((releaseDate.substring(0, 4)))}",
        maxLines: null,
        overflow: TextOverflow.visible,
        style: const TextStyle(height: 1.2, fontWeight: FontWeight.bold));
  }
}