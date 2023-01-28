import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MediaBottomNavBar extends StatelessWidget {
  final bool isVisible;
  final List<Widget> items;
  final int index;
  final ValueChanged<int>? onTap;
  const MediaBottomNavBar({
    Key? key,
    this.isVisible=true,
    required this.items,
    required this.index,
    this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isVisible?70:0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
      child: Wrap(
          children: [
            NavigationBar(
              elevation:3,
              backgroundColor: Colors.black12,
              surfaceTintColor: Colors.black45,
              animationDuration: const Duration(seconds: 2),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations:items,
              selectedIndex: index,
              onDestinationSelected: onTap
            ),
          ]
      ),
    );
  }
}


class MediaBottomNan extends StatelessWidget {
  final int index;
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final GestureTapCallback onTap3;
  final GestureTapCallback onTap4;
  final GestureTapCallback onTap5;

  const MediaBottomNan
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width-30,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX:3.5,sigmaY:3.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              GestureDetector(
                  onTap: onTap1,
                  child:Icon(Icons.info_outline,color: index==0?Colors.white:Colors.grey)),
              GestureDetector(
                  onTap: onTap2,
                  child: Icon(Icons.tv_rounded,color: index==1?Colors.white:Colors.grey)),
              GestureDetector(
                  onTap: onTap3,child: Icon(Icons.comment,color: index==2?Colors.white:Colors.grey)),
              GestureDetector(
                  onTap: onTap4,
                  child: Icon(FontAwesomeIcons.peopleGroup,color:index==3?Colors.white:Colors.grey)),
              GestureDetector(
                  onTap: onTap5,
                  child: Icon(FontAwesomeIcons.solidImages,color: index==4?Colors.white:Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}