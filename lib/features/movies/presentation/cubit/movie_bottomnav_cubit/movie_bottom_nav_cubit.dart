import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movies.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
class MovieBottomNavCubit extends Cubit<MovieBottomNavStates> {
  MovieBottomNavCubit() : super(MovieBottomNavInitialState()){
   index=0;
   isGallery=false;
   nestedController=ScrollController();
  }
  static MovieBottomNavCubit get(context) => BlocProvider.of(context);
  late int index;
  late bool isGallery;
  late final Movie movie;
  late final String listType;
  late final List<Widget> screens;
  late ScrollController nestedController;
  initScreens() {
    screens = [
      MovieOverview(movie: movie, listType: listType),
      RecommendationsMovies(movieId: movie.id),
      const MediaReviews(),
      const MediaCredits(),
      const MediaGalleryScreen()
    ];
  }
  changeScreen(int index) {
    isGallery = false;
    nestedController.animateTo(0,duration: const Duration(milliseconds: 500), curve: Curves.ease);
    if (index == 4) {
      isGallery = true;
    }
    this.index = index;
    emit(MovieBottomNavChangeState());
  }
  @override
  Future<void> close() {
    nestedController.dispose();
    return super.close();
  }
}