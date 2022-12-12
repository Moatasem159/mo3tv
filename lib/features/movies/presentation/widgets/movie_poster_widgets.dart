import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class MoviePoster extends StatelessWidget {

  final Movie movie;
  const MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MovieCubit>(context).clearObjects();
        BlocProvider.of<MovieCubit>(context).moviesId.add(movie.id!);
        BlocProvider.of<MovieCubit>(context).getMovieDetailsData(movieId: movie.id!);
        // BlocProvider.of<MovieCubit>(context).getMovieVideos(movieId: movie.id!);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie),));
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(8.0)),
            child: CachedNetworkImage(
              width: 120.0,
              height: 180,
              fit: BoxFit.cover,
              imageUrl: EndPoints.posterUrl(movie.posterPath!),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[600]!,
                child: Container(
                  height: 170.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/movieplaceholder.png"),
            ),
          ),
          Row(
            children: [
              Text("${movie.voteAverage}",style: const TextStyle(
                fontWeight: FontWeight.bold
              ),),
              const Icon(Icons.star,color: Colors.yellow,size: 20,),

            ],
          )
        ],
      ),
    );
  }
}


class MoviePosterLoading extends StatelessWidget {


  const MoviePosterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
