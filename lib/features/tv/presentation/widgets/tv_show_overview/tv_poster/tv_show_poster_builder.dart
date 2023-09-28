import 'package:flutter/material.dart';
class TvShowPosterBuilder extends StatelessWidget {
  final ImageProvider poster;
  const TvShowPosterBuilder({super.key, required this.poster});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: poster,fit: BoxFit.cover)));
  }
}