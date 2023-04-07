import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_overview/season_overview_loading_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_overview/season_overview_widget.dart';


class SeasonOverview extends StatelessWidget {
  const SeasonOverview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if(state is GetTvShowSeasonDetailsSuccessState ||cubit.tvShowSeason!=const TvShowSeason()) {
          return SeasonOverviewWidget(season:cubit.tvShowSeason!);
        }
        if(state is GetTvShowSeasonDetailsLoadingState||cubit.tvShowSeason==const TvShowSeason())
        {
          return const SeasonOverviewLoadingWidget();
        }
        return SliverToBoxAdapter(
          child: Container(),
        );
      },
    );
  }
}
