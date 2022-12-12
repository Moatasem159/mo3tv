import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyMoviesList extends StatelessWidget {
  const EmptyMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 15,),
        Icon(FontAwesomeIcons.videoSlash,size: 70,),
        SizedBox(height: 10,),
        Text("    No Videos ",style: TextStyle(fontSize: 25),),
      ],
    );
  }
}