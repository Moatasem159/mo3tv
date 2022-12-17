import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_credits.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/movie_gallery.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_reviews.dart';
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
    const MoviesReviews(),
    const MoviesCredits(),
    const MovieGallery(),


  ];
  ScrollController controller=ScrollController();

  void changeScreen(int index,context,int movieId){
    emit(MovieBottomNavChangingState());
    controller.animateTo(0, duration: const Duration(milliseconds:500), curve: Curves.ease);
    isGallery=false;
    if(index==0)
      {
        if(BlocProvider.of<MovieCubit>(context).movie == Movie()){
          BlocProvider.of<MovieCubit>(context).getMovieRecommendations(movieId: movieId);
        }
      }
    if(index==1)
      {
       if(BlocProvider.of<MovieCubit>(context).movieRecommendations==null||BlocProvider.of<MovieCubit>(context).movieRecommendations!.isEmpty){
         BlocProvider.of<MovieCubit>(context).getMovieRecommendations(movieId: movieId);
       }
      }
    if(index==2)
    {
      if(BlocProvider.of<MovieCubit>(context).movieReviews==null||BlocProvider.of<MovieCubit>(context).movieReviews!.isEmpty){
        BlocProvider.of<MovieCubit>(context).getMovieReviews(movieId: movieId);
      }
    }
    if(index==3)
    {
      if(BlocProvider.of<MovieCubit>(context).movieCredits!.isEmpty){
        BlocProvider.of<MovieCubit>(context).getMovieCredits(movieId: movieId);
      }
    }
    if(index==4)
      {
        isGallery=true;
        if(BlocProvider.of<MovieCubit>(context).movieGallery==null||BlocProvider.of<MovieCubit>(context).movieGallery!.backdrops==null){
          BlocProvider.of<MovieCubit>(context).getMovieGallery(movieId: movieId);
        }
      }
    this.index=index;
    emit(MovieBottomNavDoneState());
  }


}
