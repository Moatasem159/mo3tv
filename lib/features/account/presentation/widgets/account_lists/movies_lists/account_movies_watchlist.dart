import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/movie_watchlist_cubit/account_movie_watchlist_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class AccountMoviesWatchlist extends StatelessWidget {
  const AccountMoviesWatchlist({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          AccountMovieWatchlistCubit.get(context).getMoviesWatchlist();
          return BlocBuilder<AccountMovieWatchlistCubit,
              AccountMovieWatchlistStates>(
            builder: (context, state) {
              AccountMovieWatchlistCubit cubit = AccountMovieWatchlistCubit.get(context);
              if(state is GetAccountsMovieWatchlistLoadingState)
                {
                  return const SliverMediaLoadingList();
                }
              if(cubit.moviesWatchlist.isEmpty)
                {
                  return const EmptyAccountList(type:"movies");
                }
              if(cubit.moviesWatchlist.isNotEmpty)
              {
                return MoviesList(movieList: cubit.moviesWatchlist);
              }
              if(state is GetAccountsMovieWatchlistErrorState)
                {
                  return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getMoviesWatchlist()));
                }
              return const SliverToBoxAdapter();
            },
          );
        }
    );
  }
}