import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_info_loading_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_info_widget.dart';
class TvShowInfo extends StatelessWidget {
  const TvShowInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsSuccessState) {
          return TvShowInfoWidget(tvShow: state.tvShow);
        }
        if (state is GetTvShowDetailsLoadingState) {
          return const TvShowInfoLoadingWidget();
        }
        return Container();
      },
    );
  }
}