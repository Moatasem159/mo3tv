import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';


class PlayingNowTvShowWidget extends StatelessWidget {

  final TvShow tvShow;
  final double imageHeight;
  final double imageWidth;
  final double iconSize;
  final double playingSize;
  final double titleSize;
  const PlayingNowTvShowWidget({Key? key, required this.tvShow, required this.imageHeight, required this.imageWidth, required this.iconSize, required this.playingSize, required this.titleSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        BlocProvider.of<TvCubit>(context).clearObjects();
        BlocProvider.of<TvCubit>(context).tvIds.add(tvShow.id!);
        BlocProvider.of<TvCubit>(context).getTvShowDetailsData(tvShowId: tvShow.id!);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TvShowDetailsScreen(tvShow: tvShow),));
      },
      child: Stack(
        children: [
          ShaderMask(
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
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Center(
              child: CachedNetworkImage(
                height: imageHeight,
                width: imageWidth,
                imageUrl: EndPoints.backDropsUrl(tvShow.backdropPath!),
                errorWidget: (context, url, error) {
                  return Container();
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: iconSize,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        'Now Playing'.toUpperCase(),
                        style: TextStyle(
                          fontSize: playingSize,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
                  child: Text(
                    tvShow.originalName!,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: titleSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


