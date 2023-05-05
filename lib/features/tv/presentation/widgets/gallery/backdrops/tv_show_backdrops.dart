import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/gallery/backdrops/backdrop_list.dart';
import 'package:mo3tv/core/widgets/gallery/backdrops/backdrops_loading_list.dart';
import 'package:mo3tv/core/widgets/gallery/empty_image_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowBackdrops extends StatelessWidget {
  const TvShowBackdrops({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.backdrops!=null&&cubit.tvShowGallery!.backdrops!.isEmpty)
        {
          return const EmptyImageList(text:"No Backdrops",);
        }
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.backdrops!=null)
        {
          return BackdropsList(backdrops:cubit.tvShowGallery!.backdrops!);
        }
        if(state is GetTvShowGalleryLoadingState|| cubit.tvShowGallery ==null||cubit.tvShowGallery!.backdrops ==null)
        {
          return const BackdropsLoadingList();
        }
        return Container();
      },
    );
  }
}