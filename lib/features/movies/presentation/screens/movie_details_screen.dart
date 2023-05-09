import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit/reviews_cubit.dart';
class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  ScrollController nestedController = ScrollController();
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
  @override
  void initState() {
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
      child: BlocProvider(
        create: (context) => MovieBottomNavCubit(),
        child: BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
          builder: (context, state) {
            MovieBottomNavCubit cubit = BlocProvider.of<MovieBottomNavCubit>(context);
            return WillPopScope(
              onWillPop: () async {
                BlocProvider.of<MovieCubit>(context).clearObjects();
                GalleryCubit.get(context).initial(context);
                ReviewsCubit.get(context).initial();
                CreditsCubit.get(context).initial();
                RecommendationsMovieCubit.get(context).getList();
                BlocProvider.of<MovieCubit>(context).backToBackMovies();
                GoRouter.of(context).pop();
                return true;
              },
              child: SafeArea(
                child: Scaffold(
                    resizeToAvoidBottomInset:false,
                    backgroundColor: Theme.of(context).colorScheme.background,
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
                                cubit.screens[cubit.index]
                              ],
                            )
                        ),
                        MediaBottomNav(
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
                            cubit.changeScreen(
                            4, context, widget.movie.id!);
                          },
                          index: cubit.index,
                        ),
                      ],
                    ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}