import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
class ImageScreen extends StatelessWidget {
  final String image;
  const ImageScreen({super.key, required this.image});
  save(context) async {
    await GallerySaver.saveImage(EndPoints.hdUrl(image),
            toDcim: true, albumName: "Mo3tv")
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.black,
          content: Text(AppStrings.downloadedSuccessfully.tr(context)!)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Theme.of(context).colorScheme.surface,
          elevation: 0,
          title:IconButton(
              icon: const Icon(Icons.download), onPressed: () => save(context)),
        ),
        backgroundColor:Theme.of(context).colorScheme.surface,
        body: Hero(
          tag: image,
          child: InteractiveViewer(
            child: Center(
              child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: EndPoints.hdUrl(image))),
          ),
        ),
      ),
    );
  }
}