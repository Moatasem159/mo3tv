import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';

class AccountAppBarWidget extends StatelessWidget {
  final Account account;
  const AccountAppBarWidget({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        elevation: 10,
        leadingWidth:60,
        toolbarHeight: 70,
        titleSpacing: 4,
        title:Text(account.name==""?account.username!:account.name!),
        leading: CachedNetworkImage(
          imageUrl: EndPoints.logoUrl(account.avatar!),
          imageBuilder: (context, imageProvider) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider)
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(account.name==""?account.username![0]:account.name![0],
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),)),
            );

          },)
    );
  }
}
