import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<Movie> movies;
  final  VoidCallback? onPressed;
  const HorizontalMoviesList({
    Key? key,
    required this.movies,required  this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height/2,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<MovieCubit>(context).clearObjects();
                      BlocProvider.of<MovieCubit>(context).moviesId.add(movies[index].id!);
                      BlocProvider.of<MovieCubit>(context).getMovieDetailsData(movieId: movies[index].id!);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movies[index]),));
                    },
                    child: Hero(
                      tag: "${movies[index].id} hero",
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
                          imageUrl: EndPoints.posterUrl(movies[index].posterPath!),
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