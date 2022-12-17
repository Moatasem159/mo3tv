import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_poster_widget.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  final VoidCallback onTap;
  const HorizontalMoviesList({
    Key? key,
    required this.movies,
    required this.title,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTitle(
            title: title,
            onPressed:onTap
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MoviePoster(movie:movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}