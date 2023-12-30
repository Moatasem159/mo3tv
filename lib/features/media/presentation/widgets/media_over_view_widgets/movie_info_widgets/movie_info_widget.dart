import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_info/media_info.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
part 'budget_widget.dart';
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
            MediaInfo(
                name: widget.movie.name,
                releaseDate: widget.movie.releaseDate,
                tagline: widget.movie.tagline,
                status: widget.movie.status,
            ),
            _BudgetWidget(budget: widget.movie.budget,revenue: widget.movie.revenue),
          ],
        ),
      ),
    );
  }
}