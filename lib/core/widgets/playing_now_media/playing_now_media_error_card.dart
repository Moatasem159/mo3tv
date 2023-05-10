import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
class PlayingNowMediaErrorCard extends StatelessWidget {
  final  VoidCallback onPressed;
  const PlayingNowMediaErrorCard({Key? key,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
          color:Colors.grey[700],
          borderRadius: BorderRadius.circular(15),
        ),
        child:ErrorButton(onTap: onPressed)
      ),
    );
  }
}
