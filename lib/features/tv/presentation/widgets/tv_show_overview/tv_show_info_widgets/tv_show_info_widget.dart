import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/media_info/media_info.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
part 'season_number_widget.dart';
part 'type_widget.dart';
part 'creator_widget.dart';
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
            MediaInfo(
              name: widget.tvShow.name,
              releaseDate: widget.tvShow.firstAirDate,
              tagline: widget.tvShow.tagline,
              status: widget.tvShow.status,
            ),
            _SeasonNumberWidget(tvShow: widget.tvShow),
            _TypeWidget(type:widget.tvShow.type),
            _CreatorWidget(tvShow: widget.tvShow),
          ],
        ),
      ),
    );
  }
}