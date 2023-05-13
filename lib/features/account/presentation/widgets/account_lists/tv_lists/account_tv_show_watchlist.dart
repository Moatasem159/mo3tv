import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/tv_show_watchlist/account_tv_show_watchlist_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/tv_show_watchlist/account_tv_show_watchlist_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
class AccountTvShowsWatchlist extends StatelessWidget {
  const AccountTvShowsWatchlist({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if(!AccountTvShowWatchlistCubit.get(context).isSuccess()) {
            AccountTvShowWatchlistCubit.get(context).getAccountTvShowWatchlist();
          }
          return BlocBuilder<AccountTvShowWatchlistCubit,
              AccountTvShowWatchlistStates>(
            builder: (context, state) {
              AccountTvShowWatchlistCubit cubit = AccountTvShowWatchlistCubit.get(context);
              if(state is GetAccountsTvShowWatchlistLoadingState)
                {
                  return const SliverMediaLoadingList();
                }
              if(state is GetAccountsTvShowWatchlistSuccessState&&cubit.tvShowsWatchlist.isEmpty)
              {
                return const EmptyAccountList(type: "tv shows");
              }
              if(state is GetAccountsTvShowWatchlistSuccessState)
                {
                  return TvList(tvList: cubit.tvShowsWatchlist);
                }
              if(state is GetAccountsTvShowWatchlistErrorState)
              {
                return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountTvShowWatchlist()));
              }
              return const SliverToBoxAdapter();
            },
          );
        }
    );
  }
}