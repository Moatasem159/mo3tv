import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/review.dart';

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
              ClipOval(
                child: CachedNetworkImage(
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  imageUrl: EndPoints.logoUrl(review.authorDetails!.avatarPath!),
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
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${review.authorDetails!.name! == '' ?
                        review.authorDetails!.username :
                        review.authorDetails!.name}",
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      const SizedBox(width: 5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding:const EdgeInsets.all(2),
                        margin:const EdgeInsets.all(2),
                        child:  Row(
                          children: [
                            const Icon(Icons.star_rate,size: 14,),
                            Text(
                                "${review.authorDetails!.rating}"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text("Written By ${review.authorDetails!.name! == '' ?
                  review.authorDetails!.username :
                  review.authorDetails!.name} on ${
                      review.createdAt!.substring(0,10)
                  }",style: const TextStyle(
                    fontSize: 10,
                  ),)
                ],
              ),
            ],
          ),
          const SizedBox(height: 7,),
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


