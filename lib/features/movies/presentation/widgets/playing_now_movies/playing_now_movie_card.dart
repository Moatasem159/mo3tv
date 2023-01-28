import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_loading_card.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/movie_card.dart';

class PlayingNowMovieCard extends StatelessWidget {
  final Movie movie;
  const PlayingNowMovieCard({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MovieCubit>(context).clearObjects();
        BlocProvider.of<MovieCubit>(context).moviesId.add(movie.id!);
        BlocProvider.of<MovieCubit>(context).getMovieDetailsData(movieId: movie.id!);
        GoRouter.of(context).pushNamed(Routes.movieRoute,
          extra: movie);
      },
      child: CachedNetworkImage(
        imageUrl: EndPoints.backDropsUrl(movie.backdropPath!),
        imageBuilder: (context, imageProvider) {
          return MovieCard(
            movie: movie,
            image: imageProvider,
          );
        },
        placeholder:(context, url) => const PlayingNowMediaLoadingCard(),
      ),
    );
  }
}