import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item.dart';
class MoviesList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onPressed;
  const MoviesList({Key? key,
    required this.title,
    required this.movies, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(title: title,onPressed: onPressed),
        10.ph,
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return MovieListItem(movie: movies[index],);
            }, ),
        ),
        10.ph,
      ],
    );
  }
}