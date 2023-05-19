import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/video_widget/play_button_widget.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
class TvShowPlayButton extends StatelessWidget {
  final double shrinkOffset;
  const TvShowPlayButton({super.key, required this.shrinkOffset});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowBottomNavCubit,TvShowBottomNavStates>(
      builder: (context, state) {
        if (TvShowBottomNavCubit.get(context).index == 0) {
          return BlocBuilder<TvCubit,TvStates>(
            builder: (context, state) {
              if(state is GetTvShowDetailsSuccessState)
              {
                if(state.tvShow.trailer!=null) {
                  return PlayButtonWidget(
                    url: state.tvShow.trailer!.key!,
                    name: state.tvShow.trailer!.name!,
                    shrinkOffset: shrinkOffset,
                  );
                }
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }
}