import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AccountAppBarLoadingWidget extends StatelessWidget {
  const AccountAppBarLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        leadingWidth:60,
        toolbarHeight: 70,
        titleSpacing: 4,
        elevation: 10,
        title: Shimmer.fromColors(
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
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[600]!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
              color: Colors.grey
            ),
          ),
        ),
    );
  }
}
