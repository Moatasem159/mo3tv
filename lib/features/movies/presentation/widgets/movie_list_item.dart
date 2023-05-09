import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/media_loading/media_list_loading_item.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
class MovieListItem extends StatelessWidget {
  final Movie movie;
  const MovieListItem({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MovieCubit>(context).clearObjects();
        RecommendationsMovieCubit.get(context).add(movie.id);
        BlocProvider.of<MovieCubit>(context).moviesId.add(movie.id!);
        BlocProvider.of<MovieCubit>(context).getMovieDetailsData(movieId: movie.id!);
        GoRouter.of(context).pushNamed(Routes.movieRoute,extra:movie,);
      },
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 140,
            height:200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )
            ),
          );
        },
        imageUrl: EndPoints.posterUrl(movie.posterPath!),
        placeholder: (context, url) => const MediaListLoadingItem(),
        errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png"),
      ),
    );
  }
}