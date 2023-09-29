import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/arrow_up_button.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_screen_body.dart';
class SimilarTvShowsScreen extends StatelessWidget {
  final List<TvShow> recommendations;
  final int tvId;
  const SimilarTvShowsScreen({Key? key, required this.recommendations, required this.tvId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarTvShowCubit(di.sl())..tvId = tvId..tvShows.addAll(recommendations),
      child: BlocBuilder<SimilarTvShowCubit, SimilarTvShowStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: const SimilarTvShowsScreenBody(),
              floatingActionButton:SimilarTvShowCubit.get(context).showScrollButton
                      ? ArrowUpButton(onTap: () => SimilarTvShowCubit.get(context).scrollingUp())
                      : null,
            ),
          );
        },
      ),
    );
  }
}