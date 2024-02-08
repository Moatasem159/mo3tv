import 'package:flutter/cupertino.dart';
import 'package:mo3tv/core/utils/app_strings.dart';

class ImageEntity {
  final dynamic aspectRatio;
  final dynamic height;
  final String iso6391;
  final String filePath;
  final dynamic voteAverage;
  final dynamic voteCount;
  final dynamic width;
  const ImageEntity({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });
}
enum ImageType{
  backDrops,posters,logos,
}
mixin ImageTypes{
  double getWidth(BuildContext context,ImageType imageType) {
    double width=0;
    if(imageType == ImageType.backDrops) {
      width=MediaQuery.sizeOf(context).width * 0.9;
    }
    else if(imageType==ImageType.posters){
      width=MediaQuery.sizeOf(context).width * 0.35;
    }
    else{
      width=MediaQuery.sizeOf(context).width*0.7;
    }
    return width;
  }
  double getHeight(BuildContext context,ImageType imageType) {
    double height=0;
    if(imageType == ImageType.backDrops) {
      height=MediaQuery.sizeOf(context).height / 4.5;
    }
    else if(imageType==ImageType.posters){
      height=MediaQuery.sizeOf(context).height / 3.7;
    }
    else{
      height=MediaQuery.sizeOf(context).height*0.15;
    }
    return height;
  }
  String getTitle(ImageType imageType){
    String title="";
    if(imageType == ImageType.backDrops) {
      title=AppStrings.backdrops;
    }
    else if(imageType==ImageType.posters){
      title=AppStrings.posters;
    }
    else{
      title=AppStrings.logos;
    }
    return title;
  }
}