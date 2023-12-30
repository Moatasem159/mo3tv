import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/keywords_widgets/keyword_list_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_info/media_description.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_production_company/media_production_company_list.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
class MovieDescriptionWidget extends StatefulWidget {
  final Movie movie;
  const MovieDescriptionWidget({super.key,required this.movie});
  @override
  State<MovieDescriptionWidget> createState() => _MovieDescriptionWidgetState();
}
class _MovieDescriptionWidgetState extends State<MovieDescriptionWidget>with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,4), end: Offset.zero).animate(_curveAnimations);
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
          MediaDescription(overview: widget.movie.overview),
          KeywordListWidget(keywords:widget.movie.keywords),
          MediaProductionCompanyList(productionCompanies:widget.movie.productionCompanies)
        ],
      ),
    );
  }
}