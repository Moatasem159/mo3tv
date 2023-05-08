import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_state.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/empty_image_list.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/backdrops/backdrop_list.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/backdrops/backdrops_loading_list.dart';
class MediaBackdrops extends StatelessWidget {
  const MediaBackdrops({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryStates>(
      builder: (context, state) {
        if(state is GetMediaGallerySuccessState&&state.gallery.backdrops!.isEmpty)
        {
          return const EmptyImageList(text:"No Backdrops");
        }
        if(state is GetMediaGallerySuccessState)
        {
          return BackdropsList(backdrops:state.gallery.backdrops!);
        }
        if(state is GetMediaGalleryLoadingState)
        {
          return const BackdropsLoadingList();
        }
        return Container();
      },
    );
  }
}