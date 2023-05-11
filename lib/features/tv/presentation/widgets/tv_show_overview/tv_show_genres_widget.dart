import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowGenresWidget extends StatelessWidget {
  const TvShowGenresWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if (state is GetTvShowDetailsSuccessState || cubit.tvShow != TvShow()) {
          return Column(
            children: [
              5.ph,
              if (cubit.tvShow.genres!.isNotEmpty)
                GenresWidget(genres: cubit.tvShow.genres!,
                    isTvShow: true,
                    runTime: cubit.tvShow.episodeRunTime!.isNotEmpty ? cubit
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