import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
class MovieBottomNavCubit extends Cubit<MovieBottomNavStates> {
  MovieBottomNavCubit() : super(MovieBottomNavInitialState());
  static MovieBottomNavCubit get(context)=>BlocProvider.of(context);
  int index=0;
  bool isGallery=false;
  late final int movieId;
  ScrollController nestedController = ScrollController();
  void changeScreen(int index,context){
    isGallery=false;
    nestedController.animateTo(0, duration: const Duration(milliseconds: 500),curve: Curves.ease);
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
    emit(MovieBottomNavChangeState());
  }
  @override
  Future<void> close() {
    nestedController.dispose();
    return super.close();
  }
}