import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_poster_widgets.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "Recommendations :${recommendationMovies.length}",
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
              childCount: recommendationMovies.length,
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MoviePoster(
                      movie: recommendationMovies[index]),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .69,
                crossAxisCount: 3,
                mainAxisSpacing: 7),
          ),
          if(!BlocProvider.of<MovieCubit>(context).allRec)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text("Load more"),
                onPressed: () {
                  BlocProvider.of<MovieCubit>(context).page++;
                  BlocProvider.of<MovieCubit>(context).getMovieRecommendations(
                      movieId:  BlocProvider.of<MovieCubit>(context).movie.id,
                      page:BlocProvider.of<MovieCubit>(context).page );
                },
              ),
            ),
          ),
          if(BlocProvider.of<MovieCubit>(context).allRec)
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
                     height: 10,
                   ),
                 ],
               ) ,
            ),

        ],
      ),
    );
  }
}