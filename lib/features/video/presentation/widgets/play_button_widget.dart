import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
class PlayButtonWidget extends StatefulWidget {
  final String url;
  final String name;
  final double shrinkOffset;
  const PlayButtonWidget({super.key,required this.shrinkOffset, required this.url, required this.name});
  @override
  State<PlayButtonWidget> createState() => _PlayButtonWidgetState();
}
class _PlayButtonWidgetState extends State<PlayButtonWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    _animation=Tween<double>(begin: 0,end: 1).animate(_controller);
    _controller.forward();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Opacity(
        opacity: (1 - widget.shrinkOffset / 130),
        child: GestureDetector(
          onTap: () {
            if(1 - widget.shrinkOffset / 130>0) {
              GoRouter.of(context).pushNamed(Routes.trailerScreenRoute,queryParameters:
            {
              "url":widget.url,
              "title":widget.name
            });
            }
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
                color: Colors.red, shape: BoxShape.circle),
            child: const Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}