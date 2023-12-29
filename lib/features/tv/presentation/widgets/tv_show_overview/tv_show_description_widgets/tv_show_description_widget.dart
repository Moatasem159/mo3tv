import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';
import 'package:mo3tv/core/widgets/media_info/media_description.dart';
import 'package:mo3tv/core/widgets/media_production_company/media_production_company_list.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/season_list_widget.dart';
class TvShowDescriptionWidget extends StatefulWidget {
  final TvShow tvShow;
  const TvShowDescriptionWidget({super.key, required this.tvShow});
  @override
  State<TvShowDescriptionWidget> createState() => _TvShowDescriptionWidgetState();
}
class _TvShowDescriptionWidgetState extends State<TvShowDescriptionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,6), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideTransition,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaDescription(overview:widget.tvShow.overview),
          SeasonsListWidget(tvShow:widget.tvShow),
          MediaProductionCompanyList(productionCompanies:widget.tvShow.productionCompanies),
          KeywordListWidget(keywords:widget.tvShow.keywords),
        ],
      ),
    );
  }
}