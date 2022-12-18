import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_overview/season_overview.dart';


class SeasonDetailsScreen extends StatelessWidget {
  final TvShowSeason season;
  final String tvShowName;

  const SeasonDetailsScreen(
      {Key? key, required this.season, required this.tvShowName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
          body: WillPopScope(
            onWillPop: () async{
              BlocProvider.of<TvCubit>(context).tvShowSeason = const TvShowSeason();
              Navigator.pop(context);
              return true;
            },
            child: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: appBar,
                      sliver: SliverAppBar(
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            BlocProvider.of<TvCubit>(context).tvShowSeason = const TvShowSeason();
                            Navigator.pop(context);
                          },
                        ),
                        pinned: true,
                        expandedHeight: 540,
                        flexibleSpace: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstATop,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: EndPoints.backDropsUrl(
                                season.posterPath!),
                          ),
                        ),
                        bottom: PreferredSize(
                            preferredSize: const Size(0, 70),
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      tvShowName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      season.name!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "(${season.airDate!.substring(0, 4)})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    )
                  ];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(handle: appBar),
                    const SeasonOverview(),
                  ],
                )),
          )
        ));
  }
}
