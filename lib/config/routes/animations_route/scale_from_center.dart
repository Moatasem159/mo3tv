import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ScaleFromCenter extends CustomTransitionPage {
  ScaleFromCenter({required super.child}) : super(
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end =1.0;
      var tween = Tween<double>(begin: begin, end: end);
      var curveAnimations = CurvedAnimation(parent: animation,curve: Curves.fastEaseInToSlowEaseOut);
      return ScaleTransition(
        scale:tween.animate(curveAnimations),
        child: child,
      );
    },
  );
}