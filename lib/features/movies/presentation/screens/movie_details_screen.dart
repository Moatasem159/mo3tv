import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/tab_bar.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle disconnectBar =
    SliverOverlapAbsorberHandle();
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) => MovieBottomNavCubit(),
        child: BlocConsumer<MovieBottomNavCubit, MovieBottomNavStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MovieBottomNavCubit cubit = BlocProvider.of<MovieBottomNavCubit>(context);
            return WillPopScope(
              onWillPop: ()async {
                BlocProvider.of<MovieCubit>(context).clearObjects();
                BlocProvider.of<MovieCubit>(context).backToBackMovies();
                Navigator.pop(context);
                return true;
              },
              child: SafeArea(
                  child: Scaffold(
                    // backgroundColor: Theme.of(context).backgroundColor,
                    body:NestedScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller:cubit.controller ,
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverOverlapAbsorber(
                            handle: appBar,
                            sliver: SliverPersistentHeader(
                              delegate: MovieDetailsAppBar(movie),
                              pinned: true,
                            ),
                          ),
                          if(cubit.isGallery)
                            SliverOverlapAbsorber(
                              handle:disconnectBar,
                              sliver: GalleryTabBar(id: movie.id!,),
                            ),

                        ];
                      },
                      body:Builder(
                          builder: (context) {
                            return CustomScrollView(
                              slivers: [
                                SliverOverlapInjector(handle: appBar),
                                if(cubit.isGallery)
                                  SliverOverlapInjector(handle: disconnectBar),
                                const SliverToBoxAdapter(
                                  child: SizedBox(height: 15),
                                ),
                                BlocBuilder<MovieBottomNavCubit,MovieBottomNavStates>(
                                  builder: (context, state) {
                                    return cubit.screens[cubit.index];
                                  },
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                    bottomNavigationBar: NavigationBar(
                        elevation:3,
                        backgroundColor: Colors.black12,
                        surfaceTintColor: Colors.black45,
                        height: 60,
                        animationDuration: const Duration(seconds: 2),
                        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                        destinations: cubit.items,
                        selectedIndex: cubit.index,
                        onDestinationSelected: (value) {
                        cubit.changeScreen(value,context,movie.id!);
                      },
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
