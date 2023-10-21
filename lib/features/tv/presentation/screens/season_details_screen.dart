import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_overview/season_overview.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_screen_appbar.dart';
class SeasonDetailsScreen extends StatelessWidget {
  final TvShowSeason season;
  final String tvShowName;
  final int tvShowId;
  const SeasonDetailsScreen({super.key, required this.season, required this.tvShowName, required this.tvShowId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SeasonCubit(di.sl())..getTvShowSeasonDetailsData(tvShowId: tvShowId, seasonNumber: season.seasonNumber!),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: BlocBuilder<SeasonCubit, SeasonStates>(
              builder: (context, state) {
                return NestedScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>[
                      SeasonScreenAppBar(appBar: SeasonCubit.get(context).appBar, season: season, tvShowName: tvShowName)
                    ],
                  body: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(handle: SeasonCubit.get(context).appBar),
                      SeasonOverview(seasonNumber: season.seasonNumber!, tvShowId: tvShowId),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}