import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_bottom_nav_bar/movie_bottom_nav_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  final String listType;
  const MovieDetailsScreen({super.key, required this.movie,this.listType='?'});
  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieCubit(di.sl())),
        BlocProvider(create: (context) => MovieBottomNavCubit()..movie = movie..listType = listType..initScreens()),
        BlocProvider(create: (context) => GalleryNavigatorCubit()),
        BlocProvider(create: (context) => MovieActionsBloc(di.sl(), di.sl(), di.sl())),
        BlocProvider(create: (context) => RecommendationsMovieCubit(di.sl())),
        BlocProvider(create: (context) => di.sl<GalleryCubit>()),
        BlocProvider(create: (context) => di.sl<ReviewsCubit>()),
        BlocProvider(create: (context) => di.sl<CreditsCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
            builder: (context, state) {
              MovieBottomNavCubit cubit = MovieBottomNavCubit.get(context);
              if (!MovieCubit.get(context).isSuccess()) {
                MovieCubit.get(context).getMovieDetailsData(movieId: movie.id!,lang: AppLocalizations.of(context)!.getLang());
              }
              return WillPopScope(
                onWillPop: () async {
                  if (cubit.index != 0) {
                    cubit.changeScreen(0, context);
                    return false;
                  }
                  else {
                    return true;
                  }
                },
                child: DefaultTabController(
                  length: 3,
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      bottomNavigationBar: const MovieBottomNavbar(),
                      body: NestedScrollView(
                        controller: MovieBottomNavCubit.get(context).nestedController,
                        physics: const ClampingScrollPhysics(),
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverOverlapAbsorber(
                                handle: appBar,
                                sliver: SliverPersistentHeader(
                                    delegate: MovieDetailsAppBar(movie),
                                    pinned: true)),
                            if (cubit.isGallery)
                              SliverOverlapAbsorber(
                                handle: disconnectBar,
                                sliver: GalleryTabBar(
                                  onTap: (value) {
                                    GalleryNavigatorCubit.get(context).gallery(
                                        value);
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
                            cubit.screens[cubit.index],
                          ],
                        ),
                      ),
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