import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_screen_body.dart';
class SimilarTvShowsScreen extends StatelessWidget {
  final List<TvShow> recommendations;
  final int tvId;
  const SimilarTvShowsScreen({Key? key, required this.recommendations, required this.tvId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkBackgroundColor,
        body: SimilarTvShowsScreenBody(recommendations: recommendations, tvId: tvId),
      ),
    );
  }
}