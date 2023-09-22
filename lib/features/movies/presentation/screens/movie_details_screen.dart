import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_bottom_nav_bar/movie_bottom_nav_bar.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movies.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  final String listType;
  const MovieDetailsScreen({super.key, required this.movie,this.listType='?'});
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
  late List<Widget> screens;
  @override
  void initState() {
    screens = [
      MovieOverview(movie: widget.movie,listType: widget.listType),
      RecommendationsMovies(movieId: widget.movie.id!),
      const MediaReviews(),
      const MediaCredits(),
      const MediaGalleryScreen(),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieBottomNavCubit()..movieId=widget.movie.id!),
        BlocProvider(create: (context) => di.sl<GalleryNavigatorCubit>()),
        BlocProvider(create: (context) => di.sl<MovieCubit>()),
        BlocProvider(create: (context) => di.sl<MovieActionsBloc>()),
        BlocProvider(create: (context) => di.sl<RecommendationsMovieCubit>()),
        BlocProvider(create: (context) => di.sl<GalleryCubit>()),
        BlocProvider(create: (context) => di.sl<ReviewsCubit>()),
        BlocProvider(create: (context) => di.sl<CreditsCubit>()),
      ],
      child: Builder(
        builder: (context) {
          if(!MovieCubit.get(context).isSuccess()){
            MovieCubit.get(context).getMovieDetailsData(movieId: widget.movie.id!,lang: AppLocalizations.of(context)!.getLang());
          }
          return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
            builder: (context, state) {
              MovieBottomNavCubit cubit = MovieBottomNavCubit.get(context);
              return WillPopScope(
                onWillPop: () async{
                  if(cubit.index!=0)
                    {
                      cubit.changeScreen(0,context);
                      return false;
                    }
                  else{
                    return true;
                  }
                },
                child: DefaultTabController(
                  length: 3,
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor:Theme.of(context).colorScheme.background,
                      body: NestedScrollView(
                        controller: MovieBottomNavCubit.get(context).nestedController,
                        physics: const ClampingScrollPhysics(),
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverOverlapAbsorber(
                              handle: appBar,
                              sliver: SliverPersistentHeader(
                                delegate: MovieDetailsAppBar(
                                  widget.movie,
                                  onTap: () {
                                    MovieBottomNavCubit.get(context).nestedController.animateTo(0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                ),
                                pinned: true,
                              ),
                            ),
                            if (cubit.isGallery)
                              SliverOverlapAbsorber(
                                handle: disconnectBar,
                                sliver: GalleryTabBar(
                                  onTap: (value) {
                                    GalleryNavigatorCubit.get(context).gallery(value);
                                  },
                                ),
                              ),
                          ];
                        },
                        body: CustomScrollView(
                          slivers: [
                            SliverOverlapInjector(handle: appBar),
                            if (cubit.isGallery)
                              SliverOverlapInjector(handle: disconnectBar),
                            SliverToBoxAdapter(child: 15.ph),
                            screens[cubit.index],
                          ],
                        ),
                      ),
                      bottomNavigationBar: const MovieBottomNavbar(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}