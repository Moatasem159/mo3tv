import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_widgets/network_list_widget.dart';
import 'package:shimmer/shimmer.dart';
class TvShowNetworks extends StatelessWidget {
  const TvShowNetworks({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit,TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsSuccessState) {
          return Column(
            children: [
              20.ph,
              if(state.tvShow.networks!.isNotEmpty)
                NetworkListWidget(networks: state.tvShow.networks!),
            ],
          );
        }
        if(state is GetTvShowDetailsLoadingState)
          {
            return Column(
              children: [
                20.ph,
                const Text("Networks",style: TextStyle(fontWeight: FontWeight.bold)),
                10.ph,
                Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    
                  ),
                ),
              ],
            );
          }
        return Container();
      },
    );
  }
}