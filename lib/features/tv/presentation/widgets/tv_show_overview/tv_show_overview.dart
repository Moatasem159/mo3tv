import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_widgets/tv_show_networks.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/tv_show_description.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_details.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_genres_widget.dart';
class TvShowOverview extends StatelessWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowOverview({Key? key, required this.tvShow, this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TvShowDetails(tvShow: tvShow),
            const TvShowGenresWidget(),
            TvShowButtons(listType:listType),
            const TvShowNetworks(),
            const TvShowDescription(),
          ],
        ),
      ),
    );
  }
}