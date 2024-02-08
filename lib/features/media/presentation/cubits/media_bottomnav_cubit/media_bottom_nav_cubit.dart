import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/presentation/widgets/recommendations_media_widgets/recommendations_media.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_overview.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
part 'media_bottom_nav_state.dart';
class MediaBottomNavCubit extends Cubit<MediaBottomNavStates> {
  MediaBottomNavCubit() : super(MediaBottomNavInitialState()){
   index=0;
   isGallery=false;
   nestedController=ScrollController();
   appBar= SliverOverlapAbsorberHandle();
  }
  static MediaBottomNavCubit get(context) => BlocProvider.of(context);
  late int index;
  late bool isGallery;
  late final Media media;
  late final MediaParams params;
  late final List<Widget> screens;
  late final ScrollController nestedController;
  late final SliverOverlapAbsorberHandle appBar;
  initScreens() {
    screens = [
      MediaOverview(movie: media, params:params),
      RecommendationsMedia(mediaId: media.id,mediaType: params.mediaType),
      const MediaReviews(),
      const MediaCredits(),
      MediaGalleryScreen(mediaType: params.mediaType)
    ];
  }
  changeScreen(int index) {
    isGallery = false;
    resetList();
    if (index == 4) {
      isGallery = true;
    }
    this.index = index;
    emit(MediaBottomNavChangeState());
  }
  resetList(){
    nestedController.animateTo(0,duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
  @override
  Future<void> close() {
    nestedController.dispose();
    appBar.dispose();
    return super.close();
  }
}