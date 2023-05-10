import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movies.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  ScrollController nestedController = ScrollController();
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar =
      SliverOverlapAbsorberHandle();
  late List<Widget> screens;
  @override
  void initState() {
    screens = [
      const MovieOverview(),
      RecommendationsMovies(movieId: widget.movie.id!),
      const MediaReviews(),
      const MediaCredits(),
      const MediaGalleryScreen(),
    ];
    super.initState();
  }
  @override
  void dispose() {
    nestedController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MovieBottomNavCubit()),
          BlocProvider(create: (context) => di.sl<MovieCubit>()),
          BlocProvider(create: (context) => di.sl<RecommendationsMovieCubit>()),
          BlocProvider(create: (context) => di.sl<GalleryCubit>()),
          BlocProvider(create: (context) => di.sl<ReviewsCubit>()),
          BlocProvider(create: (context) => di.sl<CreditsCubit>()),
        ],
        child: Builder(
          builder: (context) {
            MovieCubit.get(context).getMovieDetailsData(movieId: widget.movie.id!);
            return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
              builder: (context, state) {
                MovieBottomNavCubit cubit = BlocProvider.of<MovieBottomNavCubit>(context);
                return SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: AppColors.darkBackgroundColor,
                    body: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        NestedScrollView(
                          controller: nestedController,
                          physics: const ClampingScrollPhysics(),
                          headerSliverBuilder: (context, innerBoxIsScrolled) {
                            return [
                              SliverOverlapAbsorber(
                                handle: appBar,
                                sliver: SliverPersistentHeader(
                                  delegate: MovieDetailsAppBar(
                                    widget.movie,
                                    onTap: () {
                                      nestedController.animateTo(0,
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
                        MediaBottomNav(
                          index: cubit.index,
                          onTap1: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(0, context, widget.movie.id!);
                          },
                          onTap2: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(1, context, widget.movie.id!);
                          },
                          onTap3: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(2, context, widget.movie.id!);
                          },
                          onTap4: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(3, context, widget.movie.id!);
                          },
                          onTap5: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(4, context, widget.movie.id!);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}