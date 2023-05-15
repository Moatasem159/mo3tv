import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowGenresWidget extends StatelessWidget {
  const TvShowGenresWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        if (state is GetTvShowDetailsSuccessState) {
          return Column(
            children: [
              5.ph,
              if (state.tvShow.genres!.isNotEmpty)
                GenresWidget(genres: state.tvShow.genres!,
                    isTvShow: true,
                    runTime: state.tvShow.episodeRunTime!.isNotEmpty ? state
                        .tvShow
                        .episodeRunTime![0] : 0),
            ],
          );
        }
        return Container();
      },
    );
  }
}