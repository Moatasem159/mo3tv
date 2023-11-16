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
            TvShowName(name:widget.tvShow.name,firstAirDate: widget.tvShow.firstAirDate),
            TvShowTagline(tagline: widget.tvShow.tagline),
            SeasonNumberWidget(tvShow: widget.tvShow),
            StatusWidget(status:  widget.tvShow.status),
            TypeWidget(type:widget.tvShow.type),
            CreatorWidget(tvShow: widget.tvShow),
          ],
        ),
      ),
    );
  }
}