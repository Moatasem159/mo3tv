import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:mo3tv/core/api/end_points.dart';

class ImageDialog extends StatelessWidget {
  final String ? link;
  final dynamic as;
  const ImageDialog({Key? key,this.link,this.as}) : super(key: key);


  save(context)async{
    await GallerySaver.saveImage(EndPoints.hdUrl(link!),toDcim: true,albumName: "Mo3tv").then((value){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 1500),
              content:
              Text("Downloaded successfully")));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: as,
        child: GestureDetector(
          onDoubleTap: () => save(context),
          child: CachedNetworkImage(
            imageUrl: EndPoints.hdUrl(link!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}