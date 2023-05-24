import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class GenresWidget extends StatefulWidget {
  final List<Keyword> genres;
  final num runTime;
  final bool isTvShow;
  const GenresWidget({Key? key, required this.genres, required this.runTime, required this.isTvShow}) : super(key: key);
  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}
class _GenresWidgetState extends State<GenresWidget> with SingleTickerProviderStateMixin{
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);
    _fadeController.forward();
  }
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            runSpacing: 5,
            spacing: 7,
            children: widget.genres.map((e){
              return Wrap(
                  children: [
                    Text(widget.genres.last.id !=e.id?
                    "${e.name},": "${e.name}",style:AppTextStyles.get14BoldText()),
                    if(e.id==widget.genres.last.id&&widget.runTime!=0)
                      Wrap(
                        children: [
                          5.pw,
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CircleAvatar(radius: 3,backgroundColor: Colors.white)),
                          5.pw,
                          if(widget.isTvShow)
                          Text("${widget.runTime}m",
                            style:AppTextStyles.get14BoldText()),
                          if(!widget.isTvShow)
                          Text("${widget.runTime ~/ 60}h ${widget.runTime % 60}m",
                              style:AppTextStyles.get14BoldText()),
                        ],)
                  ]
              );
            }).toList()
        ),
      ),
    );
  }
}