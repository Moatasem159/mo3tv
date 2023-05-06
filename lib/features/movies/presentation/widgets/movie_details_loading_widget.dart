import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
class MovieDetailsLoadingWidget extends StatelessWidget {
  const MovieDetailsLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      color: Colors.grey,
                      width: 200,
                      height: 300,
                    ),
                  ),
                  5.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              color: Colors.grey,
                              width: 150,
                              height: 20,
                            )),
                        Column(
                          children: [
                           15.ph,
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                color: Colors.grey,
                                width: 140,
                                height: 30,),
                            ),
                           10.ph
                          ],
                        ),
                       5.ph,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            color: Colors.grey,
                            width: 140,
                            height: 30,),
                        ),
                        10.ph,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            color: Colors.grey,
                            width: 140,
                            height: 30,),
                        ),
                        10.ph,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            color: Colors.grey,
                            width: 140,
                            height: 30,),
                        ),
                        10.ph,
                        Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            color: Colors.grey,
                            width: 140,
                            height: 30,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                              radius: 21,
                              lineWidth: 3),
                         5.pw,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("User"),
                              Text("Score"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            minimumSize: MaterialStateProperty.all(const Size(45,45)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )),
                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                        ),
                        onPressed: (){}, child:const Icon(Icons.list) ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            minimumSize: MaterialStateProperty.all(const Size(45,45)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )),
                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                        ),
                        onPressed: (){}, child:const Icon(Icons.list) ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            minimumSize: MaterialStateProperty.all(const Size(45,45)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )),
                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                        ),
                        onPressed: (){}, child:const Icon(Icons.list) ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            minimumSize: MaterialStateProperty.all(const Size(45,45)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )),
                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                        ),
                        onPressed: (){}, child:const Icon(Icons.list) ),
                  ),
                ],
              ),
              10.ph,
              Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  color: Colors.grey,
                  width: 320,
                  height: 20,),
              ),
              7.ph,
              Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  color: Colors.grey,
                  width: 320,
                  height: 20,),
              ),
              7.ph,
              Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  color: Colors.grey,
                  width: 320,
                  height: 20,),
              ),
            ],
          ),
        ),
    );
  }
}