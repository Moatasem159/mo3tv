import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_overview_success_body.dart';
class TvShowOverview extends StatelessWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowOverview({Key? key, required this.tvShow, this.listType = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsLoadingState) {
          return SliverToBoxAdapter(
              child: Center(child: Lottie.asset(AppAssets.tvLoading, height: 100)));
        }
        if (state is GetTvShowDetailsSuccessState) {
          TvActionsBloc.get(context).tvShow=state.tvShow;
          return TvShowOverviewSuccessBody(listType: listType, tvShow: state.tvShow);
        }
        if (state is GetTvShowDetailsErrorState) {
          return SliverToBoxAdapter(
              child: ErrorButton(onTap: () => TvCubit.get(context).getTvShowDetailsData(tvShowId: tvShow.id)));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}