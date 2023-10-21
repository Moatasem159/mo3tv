import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_state.dart';
class MediaGalleryScreen extends StatelessWidget {
  const MediaGalleryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryNavigatorCubit, GalleryNavigatorStates>(
      builder: (context, state) {
        return SliverToBoxAdapter(
            child: GalleryNavigatorCubit.get(context).movieGalleryList[GalleryNavigatorCubit.get(context).index]);
      },
    );
  }
}