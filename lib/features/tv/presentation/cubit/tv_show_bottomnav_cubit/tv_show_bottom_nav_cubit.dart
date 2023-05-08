import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_credits.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_overview.dart';
class TvShowBottomNavCubit extends Cubit<TvShowBottomNavStates> {
  TvShowBottomNavCubit() : super(TvShowBottomNavInitialState());
  int index=0;
  bool isGallery=false;
  List<Widget> items=const [
    NavigationDestination(icon: Icon(Icons.info_outline), label: "Overview",),
    NavigationDestination(icon: Icon(Icons.tv_rounded), label: "series",),
    NavigationDestination(icon: Icon(Icons.comment), label: "Reviews"),
    NavigationDestination(icon: Padding(
      padding: EdgeInsets.only(right:7 ),
      child: Icon(FontAwesomeIcons.peopleGroup),
    ), label: "Cast"),
    NavigationDestination(icon: Padding(
      padding: EdgeInsets.only(right: 7),
      child: Icon(FontAwesomeIcons.solidImages),
    ), label: "Gallery"),

  ];
  List<Widget> screens=[
    const TvShowOverview(),
    const RecommendationsTvShows(),
    const MediaReviews(),
    const TvShowCredits(),
    const MediaGalleryScreen(),
  ];
  void changeScreen(int index,context,int tvId){
    emit(TvShowBottomNavChangingState());
    isGallery=false;
    if(index==1)
      {
       if(TvCubit.get(context).tvRecommendations==null||TvCubit.get(context).tvRecommendations!.isEmpty){
         TvCubit.get(context).getTvShowsRecommendations(tvId: tvId);
       }
      }
    if(index==2)
    {
      if(ReviewsCubit.get(context).isInitial()){
        ReviewsCubit.get(context).getMovieReviews(mediaId: tvId, mediaType: AppStrings.tv);
      }
    }
    if(index==3)
    {
      if(TvCubit.get(context).tvShowCredits!.isEmpty){
        TvCubit.get(context).getTvShowCredits(tvId: tvId);
      }
    }
    if(index==4)
      {
        isGallery=true;
        if(GalleryCubit.get(context).isInitial())
        {
          GalleryCubit.get(context).getMediaGallery(mediaId:tvId,mediaType:AppStrings.tv);
        }
      }
    this.index=index;
    emit(TvShowBottomNavDoneState());
  }
}
