import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_credits.dart';
import 'package:mo3tv/features/tv/presentation/widgets/gallery/tv_show_gallery.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_overview.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_reviews.dart';
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
    const TvShowsReviews(),
    const TvShowCredits(),
    const TvShowGallery(),
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
      if(TvCubit.get(context).tvShowsReviews==null||TvCubit.get(context).tvShowsReviews!.isEmpty){
        TvCubit.get(context).getTvShowsReviews(tvId: tvId);
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
        if(TvCubit.get(context).tvShowGallery==null||TvCubit.get(context).tvShowGallery!.backdrops==null){
          TvCubit.get(context).getTvShowGallery(tvId: tvId);
        }
      }
    this.index=index;
    emit(TvShowBottomNavDoneState());
  }
}
