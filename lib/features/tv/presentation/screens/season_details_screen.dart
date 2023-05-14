import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_overview/season_overview.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_screen_appbar.dart';
class SeasonDetailsScreen extends StatelessWidget {
  final TvShowSeason season;
  final String tvShowName;
  final int tvShowId;
  const SeasonDetailsScreen(
      {Key? key,
      required this.season,
      required this.tvShowName,
      required this.tvShowId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    return BlocProvider(
      create: (context) => di.sl<SeasonCubit>(),
      child: Builder(
        builder: (context) {
          SeasonCubit.get(context)
              .getTvShowSeasonDetailsData(tvShowId: tvShowId, seasonNumber: season.seasonNumber!);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SeasonScreenAppBar(appBar: appBar, season: season, tvShowName: tvShowName)
                  ];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(handle: appBar),
                    const SeasonOverview(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}