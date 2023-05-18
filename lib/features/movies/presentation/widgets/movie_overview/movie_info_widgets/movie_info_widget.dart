import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/budget_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/revenue_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/status_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/tagline_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/title_widget.dart';
class MovieInfoWidget extends StatefulWidget {
  final Movie movie;
  const MovieInfoWidget({super.key, required this.movie});
  @override
  State<MovieInfoWidget> createState() => _MovieInfoWidgetState();
}
class _MovieInfoWidgetState extends State<MovieInfoWidget> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);
    _fadeController.forward();
  }
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: widget.movie.title!,releaseDate: widget.movie.releaseDate!),
            TaglineWidget(tagline: widget.movie.tagline!),
            StatusWidget(status: widget.movie.status!),
            BudgetWidget(budget: widget.movie.budget),
            RevenueWidget(revenue: widget.movie.revenue),
          ],
        ),
      ),
    );
  }
}