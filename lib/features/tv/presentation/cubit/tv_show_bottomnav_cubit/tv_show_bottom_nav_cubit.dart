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
  ScrollController controller=ScrollController();

  void changeScreen(int index,context,int tvId){
    emit(TvShowBottomNavChangingState());
    controller.animateTo(0, duration: const Duration(milliseconds:500), curve: Curves.ease);
    isGallery=false;
    // if(index==0)
    //   {
    //     if(BlocProvider.of<MovieCubit>(context).movie == Movie()){
    //       BlocProvider.of<MovieCubit>(context).getMovieRecommendations(movieId: movieId);
    //     }
    //   }
    if(index==1)
      {
       if(BlocProvider.of<TvCubit>(context).tvRecommendations==null||BlocProvider.of<TvCubit>(context).tvRecommendations!.isEmpty){
         BlocProvider.of<TvCubit>(context).getTvShowsRecommendations(tvId: tvId);
       }
      }
    if(index==2)
    {
      if(BlocProvider.of<TvCubit>(context).tvShowsReviews==null||BlocProvider.of<TvCubit>(context).tvShowsReviews!.isEmpty){
        BlocProvider.of<TvCubit>(context).getTvShowsReviews(tvId: tvId);
      }
    }
    if(index==3)
    {
      if(BlocProvider.of<TvCubit>(context).tvShowCredits!.isEmpty){
        BlocProvider.of<TvCubit>(context).getTvShowCredits(tvId: tvId);
      }
    }
    if(index==4)
      {
        isGallery=true;
        if(BlocProvider.of<TvCubit>(context).tvShowGallery==null||BlocProvider.of<TvCubit>(context).tvShowGallery!.backdrops==null){
          BlocProvider.of<TvCubit>(context).getTvShowGallery(tvId: tvId);
        }
      }
    this.index=index;
    emit(TvShowBottomNavDoneState());
  }


}
