import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReviewLoadingWidget extends StatelessWidget {

  const ReviewLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: 350,
        height: 210,
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
                Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),),
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
                        Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[600]!,
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                          padding:const EdgeInsets.all(2),
                          margin:const EdgeInsets.all(2),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: 20,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 7,),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}