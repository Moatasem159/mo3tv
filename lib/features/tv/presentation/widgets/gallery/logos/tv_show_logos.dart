import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/gallery/logos/media_logos_list.dart';
import 'package:mo3tv/core/widgets/gallery/logos/media_logos_loading_list.dart';
import 'package:mo3tv/core/widgets/gallery/empty_image_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowLogos extends StatelessWidget {
  const TvShowLogos({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.logos!=null&&cubit.tvShowGallery!.logos!.isEmpty)
          {
            return const EmptyImageList(text:"No Logos",);
          }
        if(cubit.tvShowGallery!=null&&cubit.tvShowGallery!.logos!=null)
        {
          return MediaLogosList(logos: cubit.tvShowGallery!.logos!);
        }
        if(state is GetTvShowGalleryLoadingState|| cubit.tvShowGallery ==null||cubit.tvShowGallery!.logos ==null)
          {
            return const MediaLogosLoadingList();
          }
        return Container();
      },
    );
  }
}















