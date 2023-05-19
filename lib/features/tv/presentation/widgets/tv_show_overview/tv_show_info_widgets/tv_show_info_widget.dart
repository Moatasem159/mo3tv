import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/creator_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/season_number_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/status_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_name.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_tagline.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/type_widget.dart';
class TvShowInfoWidget extends StatefulWidget {
  final TvShow tvShow;
  const TvShowInfoWidget({super.key,required this.tvShow});

  @override
  State<TvShowInfoWidget> createState() => _TvShowInfoWidgetState();
}

class _TvShowInfoWidgetState extends State<TvShowInfoWidget> with SingleTickerProviderStateMixin {
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
            TvShowName(name:widget.tvShow.originalName!,firstAirDate: widget.tvShow.firstAirDate!),
            TvShowTagline(tagline: widget.tvShow.tagline!),
            SeasonNumberWidget(tvShow: widget.tvShow),
            StatusWidget(status:  widget.tvShow.status!),
            TypeWidget(type:widget.tvShow.type!),
            CreatorWidget(tvShow: widget.tvShow),
          ],
        ),
      ),
    );
  }
}