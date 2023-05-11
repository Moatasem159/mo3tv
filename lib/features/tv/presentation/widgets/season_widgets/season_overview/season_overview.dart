import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_overview/season_overview_loading_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_overview/season_overview_widget.dart';
class SeasonOverview extends StatelessWidget {
  const SeasonOverview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeasonCubit, SeasonStates>(
      builder: (context, state) {
        if(state is GetSeasonDetailsLoadingState)
        {
          return const SeasonOverviewLoadingWidget();
        }
        if(state is GetSeasonDetailsSuccessState) {
          return SeasonOverviewWidget(season:state.season);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}