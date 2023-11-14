import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
class ReviewImage extends StatelessWidget {
  final Review review;
  const ReviewImage({super.key, required this.review});
  @override
  Widget build(BuildContext context) {
    List<Color>colors=[Colors.red,Colors.blue,Colors.yellow,Colors.teal,Colors.blueGrey,Colors.orange,Colors.indigo,];
    final random =  Random();
    return CachedNetworkImage(
      imageUrl: EndPoints.logoUrl(review.authorDetails.avatarPath),
      imageBuilder: (context, imageProvider) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image:  imageProvider,
              fit: BoxFit.cover,
            )
        ),
      ),
      placeholder: (context, imageProvider) =>Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) =>Container(
        width: 50,
        height: 50,
        decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color:colors[random.nextInt(colors.length)]
        ),
        child: Center(
          child: Text(
              review.authorDetails.name == ''
                  ? review.authorDetails.username[0].toUpperCase()
                  : review.authorDetails.name[0].toUpperCase(),
              style: AppTextStyles.get25BoldText()),
        ),
      ),
    );
  }
}