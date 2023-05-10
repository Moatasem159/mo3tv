import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class PlayingNowMovieLoadingCard extends StatelessWidget {
  const PlayingNowMovieLoadingCard({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(color:Colors.grey, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}