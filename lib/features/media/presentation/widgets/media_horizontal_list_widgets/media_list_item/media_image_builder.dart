import 'package:flutter/material.dart';
class MediaImageBuilder extends StatelessWidget {
  final ImageProvider image;
  const MediaImageBuilder({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height:200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: image,fit: BoxFit.cover)));
  }
}