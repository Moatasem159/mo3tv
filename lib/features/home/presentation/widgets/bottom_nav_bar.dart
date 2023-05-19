import 'package:flutter/material.dart';
class CustomBottomNav extends StatelessWidget {
  final int index;
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final GestureTapCallback onTap3;
  final GestureTapCallback onTap4;
  const CustomBottomNav({Key? key,
    required this.index,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 50,
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          GestureDetector(
              onTap: onTap1,
              child: Icon(Icons.movie_creation_outlined,color:index==0?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap2,
              child:  Icon(Icons.tv,color:index==1?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap3,
              child:  Icon(Icons.search,color:index==2?Colors.red:Colors.white)),
          GestureDetector(
              onTap: onTap4,
              child:  Icon(Icons.account_circle_outlined,color:index==3?Colors.red:Colors.white)),
        ],
      ),
    );
  }
}