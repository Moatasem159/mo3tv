import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_appbar_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                    body: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [

                          SliverOverlapAbsorber(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context),
                            sliver: SliverPersistentHeader(
                              delegate: MovieDetailsAppBar(movie),
                              pinned: true,
                            ),
                          ),
                          if(cubit.isGallery)
                          SliverAppBar(
                            pinned: true,
                            elevation: 10,
                            backgroundColor: Colors.black,
                            automaticallyImplyLeading: false,
                            toolbarHeight: 0,
                            bottom: PreferredSize(
                              preferredSize: const Size(0, 30),
                              child: TabBar(
                                indicatorWeight: 2,
                                indicatorColor: Colors.red,
                                labelPadding: const EdgeInsets.only(bottom: 5),
                                onTap: (value) {
                                  BlocProvider.of<MovieCubit>(context).gallery(value,movie.id);
                                },
                                tabs: const [
                                  Text("Backdrops"),
                                  Text("posters"),
                                  Text("logos"),
                                  Text("Videos"),
                                ],
                              ),
                            ),
                          ),


                        ];
                      },
                      body: Builder(builder: (context) {
                        return CustomScrollView(
                          slivers: [
                            SliverOverlapInjector(
                              handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                            ),
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
                      }),
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
