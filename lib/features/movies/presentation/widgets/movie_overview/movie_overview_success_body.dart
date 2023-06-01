import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_description_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_details.dart';
class MovieOverViewSuccessBody extends StatelessWidget {
  final Movie movie;
  final String listType;
  const MovieOverViewSuccessBody({super.key, required this.listType, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MovieDetailsWidget(movie:movie),
          GenresWidget(genres:movie.genres!,runTime: movie.runtime),
          MovieButtonsWidget(listType: listType,movie:movie),
          MovieDescriptionWidget(movie:movie),
          10.ph
        ],
      ).addSymmetricPadding(h:8),
    );
  }
}