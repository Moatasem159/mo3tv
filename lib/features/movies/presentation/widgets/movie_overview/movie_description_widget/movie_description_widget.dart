import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_companies_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_keywords_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_trailer_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/overview_widget.dart';
class MovieDescriptionWidget extends StatelessWidget {
  final Movie movie;
  const MovieDescriptionWidget({super.key,required this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTrailerWidget(trailer: movie.trailer),
        OverViewWidget(overview: movie.overview!),
        MovieKeywordsWidget(keywords:movie.keywords!),
        MovieProductionCompaniesWidget(productionCompanies:movie.productionCompanies!)
      ],
    );
  }
}