import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_movie_cubit/account_rated_movie_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class AccountRatedMoviesList extends StatelessWidget {
  const AccountRatedMoviesList({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          AccountRatedMovieCubit.get(context).getAccountRatedMovieList();
          return BlocBuilder<AccountRatedMovieCubit, AccountRatedMovieStates>(
            builder: (context, state) {
              AccountRatedMovieCubit cubit = AccountRatedMovieCubit.get(context);
              if(state is GetAccountsRatedMoviesListLoadingState)
                {
                  return const SliverMediaLoadingList();
                }
              if(cubit.ratedMovies.isEmpty)
              {
                return const EmptyAccountList(type:"movies");
              }
              if(cubit.ratedMovies.isNotEmpty)
                {
                  return MoviesList(movieList: cubit.ratedMovies);
                }
              if(state is GetAccountsRatedMoviesListErrorState)
                {
                  return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountRatedMovieList()));
                }
              return const SliverToBoxAdapter();
            },
          );
        }
    );
  }
}