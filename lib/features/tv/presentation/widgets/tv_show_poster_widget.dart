import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:shimmer/shimmer.dart';
class TvShowPoster extends StatelessWidget {
  final TvShow tvShow;
  const TvShowPoster({Key? key, required this.tvShow}) : super(key: key);
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
      child: ClipRRect(
        borderRadius:
        const BorderRadius.all(Radius.circular(8.0)),
        child: CachedNetworkImage(
          height: 170.0,
          width: 115.0,
          fit: BoxFit.cover,
          imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              height: 170.0,
              width: 115.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png"),
        ),
      ),
    );
  }
}



