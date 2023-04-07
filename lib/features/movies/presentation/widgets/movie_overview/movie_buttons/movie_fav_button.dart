import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/login_alert.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class MovieFavButton extends StatelessWidget {
  final Movie movie;
  const MovieFavButton({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        return  MediaIconButton(
          onTap:() {
            if(AppStrings.sessionId!="")
            {
              if(movie.movieAccountDetails!.favorite!){
                BlocProvider.of<MovieCubit>(context).favMovie(movieId: movie.id!, fav: false);
                movie.movieAccountDetails!.favorite =false;
                BlocProvider.of<AccountCubit>(context).favMovies.removeWhere((element) => element.id==movie.id,);
                BlocProvider.of<AccountCubit>(context).update();
              }
              else{
                BlocProvider.of<MovieCubit>(context).favMovie(movieId: movie.id!, fav: true);
                movie.movieAccountDetails!.favorite =true;
                BlocProvider.of<AccountCubit>(context).favMovies.add(movie);
                BlocProvider.of<AccountCubit>(context).update();
              }
            }
            else{
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const LoginAlert();
                },
              );
            }
          },
          icon: Icon(
              Icons.favorite,
              color:
              movie.movieAccountDetails!.favorite!?Colors.red:Colors.white
          ),
        );
      },
    );
  }
}
