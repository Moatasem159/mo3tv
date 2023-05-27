import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_events.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_buttons_state.dart';
class MovieFavButton extends StatelessWidget {
  final String listType;
  const MovieFavButton({Key? key,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieActionsBloc,MovieActionsStates>(
      builder: (context, state) {
        MovieActionsBloc bloc=MovieActionsBloc.get(context);
        return MediaIconButton(
          onTap:(){
            if(AppStrings.sessionId!="")
            {
              if(bloc.movie!.movieAccountDetails!.favorite==true)
                {
                  bloc.movie!.movieAccountDetails!.favorite =false;
                  if(listType=="favorite") {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.movie!.id);
                    AccountListsCubit.get(context).update();
                  }
                  bloc.add(FavMovieEvent(false));
                }
              else{
                bloc.movie!.movieAccountDetails!.favorite=true;
                bloc.add(FavMovieEvent(true));
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
          icon: Icon(Icons.favorite_rounded,
              color:bloc.movie!.movieAccountDetails!.favorite!?Colors.red:Colors.white));
      },
    );
  }
}