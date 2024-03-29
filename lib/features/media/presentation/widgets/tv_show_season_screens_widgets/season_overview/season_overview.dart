import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/media/presentation/cubits/season_cubit/season_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/season_cubit/season_state.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/season_overview/season_overview_loading_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/season_overview/season_overview_widget.dart';
class SeasonOverview extends StatelessWidget {
  final int seasonNumber;
  final int tvShowId;
  const SeasonOverview({super.key, required this.seasonNumber, required this.tvShowId});
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
        if(state is GetSeasonDetailsErrorState)
          {
            return ErrorButton(onTap: () =>  SeasonCubit.get(context)
                .getTvShowSeasonDetailsData(tvShowId: tvShowId, seasonNumber: seasonNumber));
          }
        return const SliverToBoxAdapter();
      },
    );
  }
}