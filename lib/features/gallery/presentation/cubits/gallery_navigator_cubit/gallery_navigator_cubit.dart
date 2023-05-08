import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_state.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/backdrops/media_backdrops.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/logos/media_logos.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery/posters/media_posters.dart';

class GalleryNavigatorCubit extends Cubit<GalleryNavigatorStates> {
  GalleryNavigatorCubit() : super(GalleryNavigatorInitialState());
  static GalleryNavigatorCubit get(context)=>BlocProvider.of(context);
  int index =0;
  List<Widget> movieGalleryList=[
    const MediaBackdrops(),
    const MediaPosters(),
    const MediaLogos(),
  ];
  gallery(value){
    index=value;
    emit(ChangeGallerySuccessState());
  }
}
