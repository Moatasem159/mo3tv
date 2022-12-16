import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/video_widget/video_dialog.dart';

class PlayMediaTrailer extends StatelessWidget {
  final String url;
  final String title;
  const PlayMediaTrailer({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      mouseCursor: MouseCursor.defer,
      onTap:() {
        showDialog(
          context: context,
          builder: (_) {
            return VideoDialog(
              url: url,
              title:title,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.play_arrow),
            SizedBox(width: 5,),
            Text("Play Trailer",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
