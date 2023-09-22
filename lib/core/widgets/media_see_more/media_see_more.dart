import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_see_more/more_movies.dart';
import 'package:mo3tv/core/widgets/media_see_more/more_tv_shows.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
class MediaSeeMore extends StatefulWidget {
  final SeeMoreParameters parameters;
  const MediaSeeMore({Key? key, required this.parameters}) : super(key: key);

  @override
  State<MediaSeeMore> createState() => _MediaSeeMoreState();
}

class _MediaSeeMoreState extends State<MediaSeeMore> {
  final ScrollController controller = ScrollController();
  bool showScrollButton = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }
  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }
  void _scrollListener() {
    setState(() {
      showScrollButton = controller.offset >= 100.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoreMoviesCubit(di.sl(),di.sl())),
        BlocProvider(create: (context) => MoreTvShowsCubit(di.sl(),di.sl())),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: widget.parameters.isMovie
              ? MoreMovies(
                  title: widget.parameters.title,
                  index: widget.parameters.index,
                  media: widget.parameters.media,
                  controller: controller)
              : MoreTvShows(
                  title: widget.parameters.title,
                  index: widget.parameters.index,
                  media: widget.parameters.media,
                  controller: controller),
          floatingActionButton: showScrollButton
              ? SizedBox(
            height: 30,
            width: 30,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              onPressed: () {
                controller.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn);
              },
              child: const Icon(Icons.arrow_upward_outlined),
            ),
          )
              : null,
        ),
      ),
    );
  }
}