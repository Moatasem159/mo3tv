import 'package:flutter/material.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/popular_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/top_rated_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/trending_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_appbar_widget.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const TvAppbar(),
        ];
      },
      body: Builder(
          builder: (context) {
            return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  const LoginButton(),
                  const TrendingTvShows(),
                  const PopularTvShows(),
                  const TopRatedTvShows(),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 15),
                  )
                ]
            );
          }
      ),
    );
  }
}
