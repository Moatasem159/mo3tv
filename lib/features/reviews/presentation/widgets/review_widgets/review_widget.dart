import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget({Key? key, required this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Color>colors=[Colors.red,Colors.blue,Colors.yellow,Colors.teal,Colors.blueGrey,Colors.orange,Colors.indigo,];
    final random =  Random();
    return Container(
      decoration:  BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: EndPoints.logoUrl(review.authorDetails!.avatarPath!),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:  imageProvider,
                        fit: BoxFit.cover,
                      )
                    ),
                  );
                },
                placeholder: (context, imageProvider) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color:colors[random.nextInt(colors.length)]
                    ),
                    child: Center(
                      child: Text(
                       review.authorDetails!.name! == '' ?
                       review.authorDetails!.username![0].toUpperCase() :
                       review.authorDetails!.name![0].toUpperCase(),
                        style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                    ),
                  );
                },
              ),
              5.pw,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        FittedBox(
                          child: Text(
                            "${review.authorDetails!.name! == '' ?
                            review.authorDetails!.username :
                            review.authorDetails!.name}",
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                       2.pw,
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          padding:const EdgeInsets.all(2),
                          margin:const EdgeInsets.all(2),
                          child:  Row(
                            children: [
                              const Icon(Icons.star_rate,size: 10,),
                              Text("${review.authorDetails!.rating}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: Text("Written By ${review.authorDetails!.name! == '' ?
                    review.authorDetails!.username :
                    review.authorDetails!.name}", style: const TextStyle(fontSize: 10)),
                  ),
                  2.ph,
                  Text("on ${review.createdAt!.substring(0,10)}"
                    ,style: const TextStyle(fontSize: 10))
                ],
              ),
            ],
          ),
          7.ph,
          Wrap(
            direction: Axis.horizontal,
            children: [
              Text(review.content!)
            ],
          )
        ],
      ),
    );
  }
}