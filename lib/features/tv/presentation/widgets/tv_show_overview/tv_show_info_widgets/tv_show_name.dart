import 'package:flutter/material.dart';
class TvShowName extends StatelessWidget {
  final String name;
  final String firstAirDate;
  const TvShowName({super.key, required this.name,required this.firstAirDate});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$name ${firstAirDate == "" ? '' : ((firstAirDate.substring(0, 4)))}",
      maxLines: null,
      overflow: TextOverflow.visible,
      style:
      const TextStyle(height: 1.2, fontWeight: FontWeight.bold),
    );
  }
}