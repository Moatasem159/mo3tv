import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_description.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_details.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_genres_widget.dart';
class MovieOverview extends StatelessWidget {
  final Movie movie;
  final String listType;
  const MovieOverview({Key? key, required this.movie,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetails(movie: movie),
            const MovieGenresWidget(),
            MovieButtons(listType: listType),
            const MovieDescription(),
            10.ph
          ],
        ),
      ),
    );
  }
}