import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/budget_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/revenue_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/status_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/tagline_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/title_widget.dart';
class MovieInfoWidget extends StatelessWidget {
  final Movie movie;
  const MovieInfoWidget({super.key,required this.movie});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title:  movie.title!,releaseDate: movie.releaseDate!),
          TaglineWidget(tagline: movie.tagline!),
          StatusWidget(status: movie.status!),
          BudgetWidget(budget: movie.budget),
          RevenueWidget(revenue: movie.revenue),
        ],
      ),
    );
  }
}