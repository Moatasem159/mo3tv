import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';


class PlayingNowMovieWidget extends StatelessWidget {

  final Movie movie;
  final double imageHeight;
  final double imageWidth;
  final double iconSize;
  final double playingSize;
  final double titleSize;
  const PlayingNowMovieWidget({Key? key, required this.movie, required this.imageHeight, required this.imageWidth, required this.iconSize, required this.playingSize, required this.titleSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        BlocProvider.of<MovieCubit>(context).clearObjects();
        BlocProvider.of<MovieCubit>(context).moviesId.add(movie.id!);
        BlocProvider.of<MovieCubit>(context).getMovieDetailsData(movieId: movie.id!);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie),));
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
                imageUrl: EndPoints.backDropsUrl(movie.backdropPath!),
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
                    movie.title!,
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


