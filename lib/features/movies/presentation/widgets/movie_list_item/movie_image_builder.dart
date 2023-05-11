import 'package:flutter/material.dart';
class MovieImageBuilder extends StatelessWidget {
  final ImageProvider image;
  const MovieImageBuilder({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height:200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          )
      ),
    );
  }
}