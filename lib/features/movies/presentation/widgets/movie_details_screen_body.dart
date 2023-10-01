import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(handle: MovieBottomNavCubit.get(context).appBar),
            if (MovieBottomNavCubit.get(context).isGallery)
            SliverOverlapInjector(handle: MovieBottomNavCubit.get(context).disconnectBar),
            SliverToBoxAdapter(child: 15.ph),
            MovieBottomNavCubit.get(context).screens[MovieBottomNavCubit.get(context).index],
          ],
        );
      },
    );
  }
}