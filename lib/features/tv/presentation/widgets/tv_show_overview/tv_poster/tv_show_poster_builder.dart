import 'package:flutter/material.dart';

class TvShowPosterBuilder extends StatelessWidget {
  final ImageProvider poster;
  const TvShowPosterBuilder({super.key, required this.poster});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: poster,
              fit: BoxFit.cover,
            )
        ));
  }
}