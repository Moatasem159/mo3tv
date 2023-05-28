import 'package:flutter/material.dart';

class MoviePosterBuilder extends StatelessWidget {
  final ImageProvider poster;
  const MoviePosterBuilder({super.key, required this.poster});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        width: 180,
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: poster,fit: BoxFit.cover)));
  }
}