import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_see_more/more_movies.dart';
import 'package:mo3tv/core/widgets/media_see_more/more_tv_shows.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
class MediaSeeMore extends StatelessWidget {
  final SeeMoreParameters parameters;
  const MediaSeeMore({Key? key,
    required this.parameters
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if(parameters.isMovie)
              {
                BlocProvider.of<MoreMoviesCubit>(context).page = 1;
                BlocProvider.of<MoreMoviesCubit>(context).moreMovies.clear();
              }
            else if(!parameters.isMovie)
              {
                MoreTvShowsCubit.get(context).page = 1;
                MoreTvShowsCubit.get(context).moreTvShows.clear();
              }
            GoRouter.of(context).pop();
            return true;
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: parameters.isMovie?
            MoreMovies(title: parameters.title, index: parameters.index):
            MoreTvShows(title: parameters. title, index:parameters.index)
          ),
        ));
  }
}