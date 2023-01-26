import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalTvShowsList extends StatelessWidget {
  final List<TvShow> tvShows;
  final  VoidCallback? onPressed;
  const HorizontalTvShowsList({Key? key,
    required this.tvShows,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height/2,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: tvShows.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<TvCubit>(context).clearObjects();
                      BlocProvider.of<TvCubit>(context).tvIds.add(tvShows[index].id!);
                      BlocProvider.of<TvCubit>(context).getTvShowDetailsData(tvShowId: tvShows[index].id!);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TvShowDetailsScreen(tvShow: tvShows[index]),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 250,
                            height:350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: imageProvider
                                )
                            ),
                          );
                        },
                        imageUrl: EndPoints.posterUrl(tvShows[index].posterPath!),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[600]!,
                          child: Container(
                            width: 250,
                            height:350,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/movieplaceholder.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onPressed,
              child: const Text('See More',
                  style: TextStyle(
                      decoration: TextDecoration.underline
                  )),
            ),
            const SizedBox(width: 5,)

          ],
        ),
      ),
    );
  }
}