import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
class TvShowDetailsScreenBody extends StatelessWidget {
  const TvShowDetailsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          slivers: [
            SliverOverlapInjector(handle: TvShowBottomNavCubit.get(context).appBar),
            if (TvShowBottomNavCubit.get(context).isGallery)
            SliverOverlapInjector(handle: TvShowBottomNavCubit.get(context).disconnectBar),
            SliverToBoxAdapter(child: 15.ph),
            TvShowBottomNavCubit.get(context).screens[TvShowBottomNavCubit.get(context).index]
          ],
        );
      },
    );
  }
}