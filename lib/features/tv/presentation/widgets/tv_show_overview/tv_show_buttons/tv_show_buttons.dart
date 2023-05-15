import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/buttons_loading_widget.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_cubit/tv_show_buttons_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons_widget.dart';
class TvShowButtons extends StatelessWidget {
  const TvShowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsSuccessState) {
          TvShowButtonsCubit.get(context).tvShow=state.tvShow;
          return TvShowButtonsWidget(tvShow: state.tvShow);
        }
        if (state is GetTvShowDetailsLoadingState) {
          return  const ButtonsLoadingWidget();
        }
        return Container();
      },
    );
  }
}