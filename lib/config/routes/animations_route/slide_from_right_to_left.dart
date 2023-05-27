import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SlideFromRightToLeft extends CustomTransitionPage {
  SlideFromRightToLeft({required Widget child})
      : super(
          child: child,
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1, 0);
            var end = const Offset(0, 0);
            var tween = Tween(begin: begin, end: end);
            var curveAnimations = CurvedAnimation(parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
            return SlideTransition(
              position: tween.animate(curveAnimations),
              child: child,
            );
          },
        );
}
