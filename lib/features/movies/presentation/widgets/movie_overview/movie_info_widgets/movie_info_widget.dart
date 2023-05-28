import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/budget_widget.dart';
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
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,2), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
        position: _slideTransition,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: widget.movie.title!,releaseDate: widget.movie.releaseDate!),
            TaglineWidget(tagline: widget.movie.tagline!),
            StatusWidget(status: widget.movie.status!),
            BudgetWidget(budget: widget.movie.budget,revenue: widget.movie.revenue),
          ],
        ),
      ),
    );
  }
}