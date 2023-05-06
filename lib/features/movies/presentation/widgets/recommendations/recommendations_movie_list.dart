import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "Recommendations :${recommendationMovies.length}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              10.ph
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
          if(!BlocProvider.of<MovieCubit>(context).allRec)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70,left: 10,right:10,top: 10 ),
              child: ElevatedButton(
                child: const Text("Load more"),
                onPressed: () {
                  BlocProvider.of<MovieCubit>(context).recPage++;
                  BlocProvider.of<MovieCubit>(context).getMovieRecommendations(
                      movieId:  BlocProvider.of<MovieCubit>(context).movie.id,
                      page:BlocProvider.of<MovieCubit>(context).recPage );
                },
              ),
            ),
          ),
          if(BlocProvider.of<MovieCubit>(context).allRec)
          SliverToBoxAdapter(
               child:Column(
                 children:[
                   8.ph,
                   const Center(child: Text("No more movies",style:TextStyle(fontWeight: FontWeight.w600))),
                   70.ph,
                 ],
               ) ,
            ),
        ],
      ),
    );
  }
}