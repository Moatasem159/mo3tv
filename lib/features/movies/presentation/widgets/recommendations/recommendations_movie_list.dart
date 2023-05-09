import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item.dart';
class RecommendationsMoviesList extends StatelessWidget {
  final List<Movie> recommendationMovies;
  const RecommendationsMoviesList({Key? key, required this.recommendationMovies}) : super(key: key);
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        "Recommendations :${recommendationMovies.length}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: const [
                            Text("See More",style: TextStyle(
                              fontSize: 15
                            )),
                            Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              15.ph
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: recommendationMovies.length,
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MovieListItem(
                      movie: recommendationMovies[index]),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .69,
                crossAxisCount: 3,
                mainAxisSpacing: 7),
          ),
          SliverToBoxAdapter(child: 75.ph,)
        ],
      ),
    );
  }
}