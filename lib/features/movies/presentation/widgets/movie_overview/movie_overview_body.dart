import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_details.dart';
class MovieOverviewBody extends StatelessWidget {
  final Movie movie;
  const MovieOverviewBody({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetails(movie:movie),
              MovieButtons(movie: movie),
              MovieDescription(movie: movie,keywords: movie.keywords!),
              80.ph,
            ],
          ),
        ),
    );
  }
}