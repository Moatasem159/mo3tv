import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/buttons_loading_widget.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons_widget.dart';
class TvShowButtons extends StatelessWidget {
  final String listType;
  const TvShowButtons({Key? key, this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsSuccessState) {
          TvActionsBloc.get(context).tvShow=state.tvShow;
          return TvShowButtonsWidget(tvShow: state.tvShow,listType:listType);
        }
        if (state is GetTvShowDetailsLoadingState) {
          return  const ButtonsLoadingWidget();
        }
        return Container();
      },
    );
  }
}