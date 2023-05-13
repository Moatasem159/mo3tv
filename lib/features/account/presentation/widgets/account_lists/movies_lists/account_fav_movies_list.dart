import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_movie_cubit/account_fav_movie_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_movie_cubit/account_fav_movie_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class AccountFavMoviesList extends StatelessWidget {
  const AccountFavMoviesList({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if(!AccountFavMovieCubit.get(context).isSuccess()) {
            AccountFavMovieCubit.get(context).getAccountFavoriteMovies();
          }
          return BlocBuilder<AccountFavMovieCubit, AccountFavMovieStates>(
            builder: (context, state) {
              AccountFavMovieCubit cubit = AccountFavMovieCubit.get(context);
              if(state is GetAccountsFavoriteMoviesListLoadingState)
              {
                return const SliverMediaLoadingList();
              }
              if(state is GetAccountsFavoriteMoviesListSuccessState&&cubit.favMovies.isEmpty)
              {
                return const EmptyAccountList(type:"movies");
              }
              if(state is GetAccountsFavoriteMoviesListSuccessState)
              {
                return MoviesList(movieList: cubit.favMovies);
              }
              if(state is GetAccountsFavoriteMoviesListErrorState)
              {
                return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountFavoriteMovies()));
              }
              return const SliverToBoxAdapter();
            },
          );
        }
    );
  }
}