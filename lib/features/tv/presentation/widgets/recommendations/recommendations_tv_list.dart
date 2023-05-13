import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
class RecommendationsTvShowsList extends StatelessWidget {
  final List<TvShow> recommendationTvShows;
  final int tvId;
  const RecommendationsTvShowsList({Key? key, required this.recommendationTvShows, required this.tvId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        "Recommendations :${recommendationTvShows.length}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            Routes.similarTvShowsRoute,
                            extra: recommendationTvShows,
                            queryParameters: {'tvId': tvId.toString()});
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("See More", style: TextStyle(fontSize: 15)),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              10.ph
              ],
            ),
          ),
          TvList(tvList: recommendationTvShows),
          SliverToBoxAdapter(
            child: 75.ph,
          )
        ],
      ),
    );
  }
}