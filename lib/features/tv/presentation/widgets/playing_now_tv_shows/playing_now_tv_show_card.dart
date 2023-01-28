import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_loading_card.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/tv_show_card.dart';

class PlayingNowTvShowCard extends StatelessWidget {
  final TvShow tvShow;
  const PlayingNowTvShowCard({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TvCubit>(context).clearObjects();
        BlocProvider.of<TvCubit>(context).tvIds.add(tvShow.id!);
        BlocProvider.of<TvCubit>(context).getTvShowDetailsData(tvShowId: tvShow.id!);
        GoRouter.of(context).pushNamed(Routes.tvShowRoute,
            extra: tvShow);
      },
      child: CachedNetworkImage(
        imageUrl: EndPoints.backDropsUrl(tvShow.backdropPath!),
        imageBuilder: (context, imageProvider) {
          return TvShowCard(
            tvShow:  tvShow,
            image: imageProvider,
          );
        },
        placeholder:(context, url) => const PlayingNowMediaLoadingCard(),
      ),
    );
  }
}