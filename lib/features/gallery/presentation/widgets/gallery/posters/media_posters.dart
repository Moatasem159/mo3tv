import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_state.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/empty_image_list.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/posters/media_posters_list.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/posters/media_posters_loading_list.dart';
class MediaPosters extends StatelessWidget {
  const MediaPosters({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryStates>(
      builder: (context, state) {
        if(state is GetMediaGallerySuccessState&&state.gallery.posters.isEmpty)
        {
          return const EmptyImageList(text:AppStrings.noPosters);
        }
        if(state is GetMediaGallerySuccessState)
        {
          return MediaPostersList(posters: state.gallery.posters);
        }
        if(state is GetMediaGalleryLoadingState)
        {
          return const MediaPosterLoadingList();
        }
        if(state is GetMediaGalleryErrorState)
        {
          return ErrorButton(onTap:()=> GalleryCubit.get(context).getMediaGallery());
        }
        return Container();
      },
    );
  }
}