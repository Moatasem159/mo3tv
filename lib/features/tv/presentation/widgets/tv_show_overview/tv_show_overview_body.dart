import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_details.dart';
class TvShowOverviewBody extends StatelessWidget {
  final TvShow tvShow;
  const TvShowOverviewBody({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TvShowDetails(tvShow: tvShow),
              TvShowButtons(tvShow: tvShow),
              TvShowDescription(tvShow: tvShow,keywords: tvShow.keywords!),
              60.ph
            ],
          ),
        ),
    );
  }
}