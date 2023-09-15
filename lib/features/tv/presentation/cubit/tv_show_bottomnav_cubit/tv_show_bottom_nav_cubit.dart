import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
class TvShowBottomNavCubit extends Cubit<TvShowBottomNavStates> {
  TvShowBottomNavCubit() : super(TvShowBottomNavInitialState());
  static TvShowBottomNavCubit get(context)=>BlocProvider.of(context);
  int index=0;
  bool isGallery=false;
  late final int tvId;
  ScrollController nestedController = ScrollController();
  void changeScreen(int index,context){
    isGallery=false;
    nestedController.animateTo(0,duration: const Duration(milliseconds: 500),curve: Curves.ease);
    if(index==2)
    {
      if(ReviewsCubit.get(context).isInitial()){
        ReviewsCubit.get(context).getMovieReviews(mediaId: tvId, mediaType: AppStrings.tv);
      }
    }
    if(index==3)
    {
      if(CreditsCubit.get(context).isInitial())
      {
        CreditsCubit.get(context).getMovieCredits(mediaId:tvId,mediaType:AppStrings.tv);
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
    emit(TvShowBottomNavChangeState());
  }
  @override
  Future<void> close() {
    nestedController.dispose();
    return super.close();
  }
}