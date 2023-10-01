import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class MediaPlayingNowCardBuilder extends StatelessWidget {
  final ImageProvider image;
  final Media media;
  const MediaPlayingNowCardBuilder({Key? key, required this.image,required this.media}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3.5,
      width: MediaQuery.of(context).size.width-50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(fit: BoxFit.cover, image: image)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                  margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                  decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppStrings.nowPlaying.tr(context)!, style: AppTextStyles.get14BoldText()),
                      4.pw,
                      const Icon(Icons.circle,color: Colors.redAccent,size: 12).addPadding(t: 3),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                  margin: const EdgeInsets.symmetric(horizontal: 2,vertical:3),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    media.name!,
                    maxLines: null,
                    style: AppTextStyles.get18BoldText()
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 3),
              decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Text(
                    media.voteAverage.toString(),
                    style:AppTextStyles.get14BoldText()),
                  4.pw,
                  const Icon(Icons.star_rounded,size: 15,color: Colors.yellow).addPadding(t: 3)
                ],
              ),
          ),
        ],
      ).addAllPadding(5),
    );
  }
}