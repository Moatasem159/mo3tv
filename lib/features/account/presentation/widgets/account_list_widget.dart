import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/account/presentation/screens/media_list_screen.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:shimmer/shimmer.dart';

class AccountListWidget extends StatelessWidget {
  final List list;
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  const AccountListWidget({Key? key,
    required this.list,
    required this.title,
    this.favMovies = false,
    this.ratedMovies = false,
    this.moviesWatchlist = false,
    this.favTv = false,
    this.ratedTv = false,
    this.tvWatchlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random =  Random();
    if(list.isNotEmpty){
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>
              MediaListScreen(
              favMovies:favMovies,
              ratedMovies:ratedMovies,
              favTv:favTv,
              ratedTv: ratedTv,
              tvWatchlist:tvWatchlist ,
              moviesWatchlist:moviesWatchlist,
              title: title),));
        },
        child: CachedNetworkImage(
          imageUrl:EndPoints.backDropsUrl(
              list[random.nextInt(list.length)].backdropPath!),
          imageBuilder: (context, imageProvider) {
            return ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0, 0.5, 0.5, 1],
                )
                    .createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstATop,
              child: Container(
                margin: const EdgeInsets.all(10),
                height:200,
                width:400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Text(title,style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                          ),),
                          const SizedBox(height: 5,),
                          if(list.length>1)
                            Text("${list.length} items",style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),),
                          if(list.length==1)
                            Text("${list.length} item",style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                margin: const EdgeInsets.all(10),
                height:200,
                width: 400,
                decoration: BoxDecoration(
                  color:Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      );
    }
    if(list.isEmpty){
      return EmptyAccountList(title: title,);
    }
    return Container();
  }
}
