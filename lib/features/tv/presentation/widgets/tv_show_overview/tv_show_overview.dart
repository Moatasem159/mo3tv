import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_details_loading_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_details.dart';


class TvShowOverview extends StatelessWidget {
  const TvShowOverview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if (state is GetTvShowDetailsSuccessState || cubit.tvShow != TvShow()) {
          return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TvShowDetails(
                      tvShow: cubit.tvShow,
                    ),
                    TvShowButtons(tvShow: cubit.tvShow),
                    TvShowDescription(
                      tvShow: cubit.tvShow,
                      keywords: cubit.tvShow.keywords!,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ));
        }
        if (state is GetTvShowDetailsLoadingState ||
            cubit.tvShow ==  TvShow()) {
          return const MovieDetailsLoadingWidget();
        }
        return const SizedBox();
      },
    );
  }
}







