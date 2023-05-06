import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:shimmer/shimmer.dart';
class SeasonOverviewLoadingWidget extends StatelessWidget {
  const SeasonOverviewLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
         10.ph,
          Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 7, vertical: 10),
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 170,
                          height: 120,
                          color: Colors.grey,
                        ),
                      ),
                     7.pw,
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[700]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(
                              height:25,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey
                              ),
                            ),
                          ),
                         4.ph,
                          Shimmer.fromColors(
                            baseColor: Colors.grey[700]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(
                              height:25,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          4.ph,
                          Shimmer.fromColors(
                            baseColor: Colors.grey[700]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(
                              height:25,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          4.ph,
                          Shimmer.fromColors(
                            baseColor: Colors.grey[700]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(
                              height:25,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  5.ph,
                  Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(
                          height:20,
                          width: 335,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                        ),
                      ),
                      10.ph,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(
                          height:20,
                          width: 335,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                        ),
                      ),
                      10.ph,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(
                          height:20,
                          width: 335,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}