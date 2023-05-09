import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movies.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview.dart';
class MovieBottomNavCubit extends Cubit<MovieBottomNavStates> {
  MovieBottomNavCubit() : super(MovieBottomNavInitialState());
  int index=0;
  bool isGallery=false;
  List<Widget> items=const [
    NavigationDestination(icon: Icon(Icons.info_outline), label: "Overview",),
    NavigationDestination(icon: Icon(Icons.movie_outlined), label: "Movies",),
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
    const MovieOverview(),
    const RecommendationsMovies(),
    const MediaReviews(),
    const MediaCredits(),
    const MediaGalleryScreen(),
  ];
  void changeScreen(int index,context,int movieId){
    emit(MovieBottomNavChangingState());
    isGallery=false;
    if(index==0)
      {
        // if(BlocProvider.of<MovieCubit>(context).movie == Movie()){
        //   BlocProvider.of<MovieCubit>(context).getMovieRecommendations(movieId: movieId);
        // }
      }
    if(index==1)
      {
       if(RecommendationsMovieCubit.get(context).isInitial()){
         RecommendationsMovieCubit.get(context).getMovieRecommendations(movieId: movieId);
       }
      }
    if(index==2)
    {
      if(ReviewsCubit.get(context).isInitial()){
       ReviewsCubit.get(context).getMovieReviews(mediaId: movieId, mediaType: AppStrings.movie);
      }
    }
    if(index==3)
    {
      if(CreditsCubit.get(context).isInitial())
      {
        CreditsCubit.get(context).getMovieCredits(mediaId:movieId,mediaType:AppStrings.movie);
      }
    }
    if(index==4)
      {
        isGallery=true;
       if(GalleryCubit.get(context).isInitial())
         {
           GalleryCubit.get(context).getMediaGallery(mediaId:movieId,mediaType:AppStrings.movie);
         }
      }
    this.index=index;
    emit(MovieBottomNavDoneState());
  }
}
