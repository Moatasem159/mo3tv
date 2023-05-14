import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:mo3tv/core/api/end_points.dart';

class ImageScreen extends StatelessWidget {
  final String image;

  const ImageScreen({Key? key, required this.image}) : super(key: key);

  save(context) async {
    await GallerySaver.saveImage(EndPoints.hdUrl(image),
            toDcim: true, albumName: "Mo3tv")
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 1500),
          content: Text("Downloaded successfully")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: IconButton(
              icon: const Icon(Icons.download), onPressed: () => save(context)),
        ),
        backgroundColor: Colors.black26,
        body: Hero(
          tag: image,
          child: InteractiveViewer(
            child: Center(
              child: CachedNetworkImage(
                  fit: BoxFit.contain, imageUrl: EndPoints.hdUrl(image)),
            ),
          ),
        ),
      ),
    );
  }
}
