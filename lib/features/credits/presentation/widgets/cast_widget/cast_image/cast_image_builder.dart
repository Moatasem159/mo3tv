import 'package:flutter/material.dart';
class CastImageBuilder extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  const CastImageBuilder({super.key, required this.imageProvider});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
      ),
    );
  }
}