import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_widgets/network_list_widget.dart';
class TvShowNetworks extends StatelessWidget {
  const TvShowNetworks({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit,TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if (state is GetTvShowDetailsSuccessState || cubit.tvShow != TvShow()) {
          return Column(
            children: [
              20.ph,
              if(cubit.tvShow.networks!.isNotEmpty)
                NetworkListWidget(networks: cubit.tvShow.networks!),
            ],
          );
        }
        return Container();
      },
    );
  }
}