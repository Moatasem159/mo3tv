import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_movie_cubit/account_fav_movie_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_tv_show_cubit/account_fav_tv_show_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_tv_show_cubit/account_rated_tv_shows_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/tv_show_watchlist/account_tv_show_watchlist_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_state.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_button_widget.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_dialog.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_loading_indicator.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: BlocConsumer<LogOutCubit, LogOutStates>(
        listener: (context, state) {
          if(state is LogOutSuccessState)
            {
              showDialog(context: context, builder:(context) => const LogOutDialog());
              login();
              LoginCubit.get(context).initial();
              AccountCubit.get(context).initial();
              AccountFavMovieCubit.get(context).initial();
              AccountRatedMovieCubit.get(context).initial();
              AccountMovieWatchlistCubit.get(context).initial();
              AccountFavTvShowCubit.get(context).initial();
              AccountRatedTvShowsCubit.get(context).initial();
              AccountTvShowWatchlistCubit.get(context).initial();
            }
        },
        builder: (context, state) {
          if(state is LogOutLoadingState)
          {
            return const LogOutLoadingIndicator();
          }
          if(state is !LogOutLoadingState) {
            return const LogOutButtonWidget();
          }
          return Container();
        },
      ),
    );
  }
}