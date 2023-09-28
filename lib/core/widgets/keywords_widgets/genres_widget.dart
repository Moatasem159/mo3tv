import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class GenresWidget extends StatefulWidget {
  final List<Keyword> genres;
  final num runTime;
  final String link;
  const GenresWidget({Key? key, required this.genres, required this.runTime, required this.link}) : super(key: key);
  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}
class _GenresWidgetState extends State<GenresWidget> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,10), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:  _slideTransition,
      child: Align(
        alignment: AppLocalizations.of(context)!.isEnLocale?Alignment.centerLeft:Alignment.centerRight,
        child: Wrap(
            runSpacing: 5,
            spacing: 7,
            children: widget.genres.map((e){
              return Wrap(
                  children: [
                    Text(widget.genres.last.id !=e.id?
                    "${e.name},": "${e.name}",
                        textAlign: TextAlign.center,
                        style:AppTextStyles.get14BoldText(height: AppLocalizations.of(context)!.isEnLocale?1.5:0)),
                    if(e.id==widget.genres.last.id&&widget.runTime!=0)
                      Wrap(
                        children: [
                          5.pw,
                          const CircleAvatar(radius: 3,backgroundColor: Colors.white).addPadding(t:10),
                          5.pw,
                          Text("${widget.runTime ~/ 60==0?'':'${widget.runTime ~/ 60}h'}"
                              " ${widget.runTime % 60==0?"":"${widget.runTime % 60}m"}",
                              style:AppTextStyles.get14BoldText()),
                          8.pw,
                          if(widget.link!="")
                          GestureDetector(
                            onTap:() => GoRouter.of(context).pushNamed( Routes.mediaWebPageRoute,pathParameters:{
                              "link":widget.link}),
                              child: const Icon(Icons.link_rounded))
                        ],)
                  ]
              );
            }).toList()
        ),
      ).addSymmetricPadding(h: 8),
    );
  }
}