import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/gallery/posters/media_posters_list.dart';
import 'package:mo3tv/core/widgets/gallery/posters/media_posters_loading_list.dart';
import 'package:mo3tv/core/widgets/gallery/empty_image_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';

class TvShowPosters extends StatelessWidget {
  const TvShowPosters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.posters!=null&&cubit.tvShowGallery!.posters!.isEmpty)
        {
          return const EmptyImageList(text:"No posters",);
        }
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.posters!=null)
        {
          return MediaPostersList(posters: cubit.tvShowGallery!.posters!);
        }
        if(state is GetTvShowGalleryLoadingState||cubit.tvShowGallery ==null||cubit.tvShowGallery!.posters ==null)
        {
          return const MediaPosterLoadingList();
        }
        return Container();

      },
    );
  }
}