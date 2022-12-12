import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/button.dart';

class MovieFavButton extends StatelessWidget {
  final Movie movie;
  const MovieFavButton({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieCubit, MovieStates>(
      listener: (context, state) {
        if(state is FavMovieSuccessState &&state.statusCode==13)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Removed from favourites")));
        }
        else if(state is FavMovieSuccessState&& state.statusCode==1)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Added to favourites")));
        }
      },
      child: MovieButton(
            onTap:() {
              if(BlocProvider.of<AccountCubit>(context).favMovies!.any((element)=>element.id! ==movie.id!)){
                BlocProvider.of<MovieCubit>(context).favMovie(movieId: movie.id!, fav: false);
                BlocProvider.of<AccountCubit>(context).favMovies!.removeWhere((element) => element.id! ==movie.id!,);
              }
              else{
                BlocProvider.of<MovieCubit>(context).favMovie(movieId: movie.id!, fav: true);
                BlocProvider.of<AccountCubit>(context).favMovies!.add(movie);
              }
            },
          icon: Icon(
            Icons.favorite,
            color: BlocProvider.of<AccountCubit>(context).favMovies!.any((element)=>element.id! ==movie.id!)?Colors.red:Colors.white,
          ),
        ),
    );
  }
}
