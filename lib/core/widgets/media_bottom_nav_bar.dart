import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MediaBottomNav extends StatelessWidget {
  final int index;
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final GestureTapCallback onTap3;
  final GestureTapCallback onTap4;
  final GestureTapCallback onTap5;
  const MediaBottomNav
      ({Key? key,
    required this.index,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      color:Theme.of(context).colorScheme.background,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          GestureDetector(
              onTap: onTap1,
              child:Icon(Icons.info_outline,color: index==0?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap2,
              child: Icon(Icons.tv_rounded,color: index==1?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap3,child: Icon(Icons.comment,color: index==2?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap4,
              child: Icon(FontAwesomeIcons.peopleGroup,color:index==3?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap5,
              child: Icon(FontAwesomeIcons.solidImages,color: index==4?Colors.red:Colors.white)),
        ],
      ),
    );
  }
}