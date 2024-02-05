import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_buttons/media_buttons_widget.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/movie_info_widgets/movie_description_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/movie_info_widgets/movie_details.dart';
class MovieOverViewSuccessBody extends StatelessWidget {
  final Movie movie;
  final String listType;
  const MovieOverViewSuccessBody({super.key, required this.listType, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          MovieDetailsWidget(movie: movie),
          GenresWidget(genres: movie.genres, runTime: movie.runtime, link: movie.homepage),
          MediaButtonsWidget(listType: listType, movie: movie),
          MovieDescriptionWidget(movie: movie),
        ],
      ),
    );
  }
}