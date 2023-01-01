import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/core/widgets/gallery/gallery_tab_bar.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  ScrollController nestedController = ScrollController();
  bool isVisible = true;
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar =
      SliverOverlapAbsorberHandle();

  @override
  void initState() {
    super.initState();
    nestedController.addListener(listen);
  }

  @override
  void dispose() {
    nestedController.removeListener(listen);
    nestedController.dispose();
    super.dispose();
  }

  void listen() {
    if (nestedController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      hide();
    } else if (nestedController.position.userScrollDirection ==
        ScrollDirection.forward) {
      show();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) => MovieBottomNavCubit(),
        child: BlocConsumer<MovieBottomNavCubit, MovieBottomNavStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MovieBottomNavCubit cubit =
                BlocProvider.of<MovieBottomNavCubit>(context);
            return WillPopScope(
              onWillPop: () async {
                BlocProvider.of<MovieCubit>(context).clearObjects();
                BlocProvider.of<MovieCubit>(context).backToBackMovies();
                Navigator.pop(context);
                return true;
              },
              child: SafeArea(
                child: Scaffold(
                    backgroundColor: Theme.of(context).backgroundColor,
                    body: NestedScrollView(
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
                                    show();
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
                                    BlocProvider.of<MovieCubit>(context)
                                        .gallery(value);
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
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 15),
                            ),
                            cubit.screens[cubit.index]
                          ],
                        )),
                    bottomNavigationBar: MediaBottomNavBar(
                      items: cubit.items,
                      isVisible: isVisible,
                      index: cubit.index,
                      onTap: (value) {
                        nestedController.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                        cubit.changeScreen(value, context, widget.movie.id!);
                      },
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
