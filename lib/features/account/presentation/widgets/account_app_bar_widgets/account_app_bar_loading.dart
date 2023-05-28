import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class AccountAppBarLoadingWidget extends StatelessWidget {
  const AccountAppBarLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[600]!,
          child: Container(
            height:50,
            width:50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            ),
          ),
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              width: 230,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
            )),
      ],
    );
  }
}