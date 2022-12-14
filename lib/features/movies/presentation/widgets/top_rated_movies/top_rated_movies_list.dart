import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/list_title.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_poster_widgets.dart';

class TopRatedMoviesList extends StatelessWidget {
  final List<Movie> topRatedMovies;
  const TopRatedMoviesList({Key? key, required this.topRatedMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          const ListTitle(title: "Top Rated"),
          SizedBox(
            height: 170,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MoviePoster(movie: topRatedMovies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}