import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';

class GenresWidget extends StatelessWidget {
  final List<Keyword> genres;
  final num runTime;
  final bool isTvShow;
  const GenresWidget({Key? key, required this.genres, required this.runTime, required this.isTvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          runSpacing: 5,
          spacing: 7,
          children: genres.map((e){
            return Wrap(
                children: [
                  Text(genres.last.id !=e.id?
                  "${e.name},": "${e.name}",style:const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  if(e.id==genres.last.id&&runTime!=0)
                    Wrap(
                      children: [
                        const SizedBox(width:5 ,),
                        const Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width:5 ,),
                        if(isTvShow)
                        Text("${runTime}m",
                          style:const TextStyle(fontWeight: FontWeight.bold) ,),
                        if(!isTvShow)
                        Text("${runTime ~/ 60}h ${runTime % 60}m",
                            style:const TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ],)
                ]
            );
          }).toList()
      ),
    );
  }
}