import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list_item.dart';
class RecommendationsTvShowsList extends StatelessWidget {
  final List<TvShow> recommendationTvShows;
  const RecommendationsTvShowsList({Key? key, required this.recommendationTvShows}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "Recommendations :${recommendationTvShows.length}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: recommendationTvShows.length,
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TvShowListItem(
                      tvShow:recommendationTvShows[index]),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .65,
                crossAxisCount: 3,
                mainAxisSpacing: 7),
          ),
          if(!TvCubit.get(context).allRec)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70,left: 10,right:10,top: 10 ),
                child: ElevatedButton(
                  child: const Text("Load more"),
                  onPressed: () {
                    TvCubit.get(context).page++;
                    TvCubit.get(context).getTvShowsRecommendations(
                        tvId:TvCubit.get(context).tvShow.id,
                        page:TvCubit.get(context).page );
                  },
                ),
              ),
            ),
          if(TvCubit.get(context).allRec)
            SliverToBoxAdapter(
              child:Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  Center(child: Text("No more movies",
                    style:TextStyle(
                        fontWeight: FontWeight.w600
                    ) ,)),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ) ,
            ),
        ],
      ),
    );
  }
}