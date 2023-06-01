import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_cubit.dart';
class MovieBottomNavCubit extends Cubit<MovieBottomNavStates> {
  MovieBottomNavCubit() : super(MovieBottomNavInitialState());
  static MovieBottomNavCubit get(context)=>BlocProvider.of(context);
  int index=0;
  bool isGallery=false;
  List<Widget> items=[
    const NavigationDestination(icon: Icon(Icons.info_outline), label: "Overview",),
    const NavigationDestination(icon: Icon(Icons.movie_outlined), label: "Movies",),
    const NavigationDestination(icon: Icon(Icons.comment), label: "Reviews"),
    NavigationDestination(icon: const Icon(FontAwesomeIcons.peopleGroup).addPadding(r: 7), label: "Cast"),
    NavigationDestination(icon: const Icon(FontAwesomeIcons.solidImages).addPadding(r: 7), label: "Gallery"),

  ];

  void changeScreen(int index,context,int movieId){
    emit(MovieBottomNavChangingState());
    isGallery=false;
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
