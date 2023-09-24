import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/core/widgets/toast/custom_toast.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_events.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_state.dart';
class AddMovieToWatchlistButton extends StatelessWidget {
  final String listType;
  const AddMovieToWatchlistButton({Key? key,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieActionsBloc,MovieActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="watchList")
        {
        CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        MovieActionsBloc bloc=MovieActionsBloc.get(context);
        return MediaIconButton(
          onTap: (){
            if(AppStrings.sessionId!='')
            {
              if(bloc.movie.movieAccountDetails!.watchlist==true)
                {
                  bloc.movie.movieAccountDetails!.watchlist=false;
                  bloc.add(WatchListMovieEvent(false));
                  if(listType=="watchlist")
                  {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.movie.id);
                    AccountListsCubit.get(context).update();
                  }
                }
              else{
                bloc.movie.movieAccountDetails!.watchlist=true;
                if(listType=="watchlist")
                {
                  AccountListsCubit.get(context).list.add(bloc.movie);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(WatchListMovieEvent(true));
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
          icon: bloc.movie.movieAccountDetails!.watchlist!
              ? const Icon(Icons.bookmark_rounded, color: Colors.green)
              : const Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }
}