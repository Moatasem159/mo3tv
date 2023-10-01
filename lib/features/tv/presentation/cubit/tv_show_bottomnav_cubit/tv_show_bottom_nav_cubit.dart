import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_overview.dart';
class TvShowBottomNavCubit extends Cubit<TvShowBottomNavStates> {
  TvShowBottomNavCubit() : super(TvShowBottomNavInitialState()){
    index=0;
    isGallery=false;
    nestedController=ScrollController();
  }
  static TvShowBottomNavCubit get(context)=>BlocProvider.of(context);
  late int index;
  late bool isGallery;
  late final TvShow tvShow;
  late final String listType;
  late ScrollController nestedController;
  late final List<Widget> screens;
  initScreens(){
    screens = [
      TvShowOverview(tvShow: tvShow, listType: listType),
      RecommendationsTvShows(tvId: tvShow.id),
      const MediaReviews(),
      const MediaCredits(),
      const MediaGalleryScreen(),
    ];
  }
  void changeScreen(int index){
    isGallery=false;
    resetList();
    if(index==4)
      {
        isGallery=true;
      }
    this.index=index;
    emit(TvShowBottomNavChangeState());
  }
  resetList(){
    nestedController.animateTo(0,duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
  @override
  Future<void> close() {
    nestedController.dispose();
    return super.close();
  }
}