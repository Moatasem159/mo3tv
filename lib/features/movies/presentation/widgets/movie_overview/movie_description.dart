import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';
import 'package:mo3tv/core/widgets/play_media_trailer.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/production_company_widgets/production_company_list_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;
  final List<Keyword> keywords;

  const MovieDescription({
    Key? key,
    required this.movie,
    required this.keywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movie.trailer != null)
          PlayMediaTrailer(
            url: movie.trailer!.key!,
            title: movie.trailer!.name!,
          ),
        10.ph,
        Text(
          movie.overview!,
          style:
              const TextStyle(wordSpacing: 2, height: 1.4, letterSpacing: 1.1),
        ),
        10.ph,
        if (keywords.isNotEmpty)
          KeywordListWidget(keywords: keywords),
       7.ph,
        if (movie.productionCompanies!.isNotEmpty)
          ProductionCompanyListWidget(
            productionCompanies: movie.productionCompanies!,
          )
      ],
    );
  }
}