import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_tv_show_cubit/account_fav_tv_show_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_tv_show_cubit/account_fav_tv_show_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
class AccountFavTvShowsList extends StatelessWidget {
  const AccountFavTvShowsList({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if(!AccountFavTvShowCubit.get(context).isSuccess()) {
            AccountFavTvShowCubit.get(context).getAccountFavTvShows();
          }
          return BlocBuilder<AccountFavTvShowCubit, AccountFavTvShowStates>(
            builder: (context, state) {
              AccountFavTvShowCubit cubit = AccountFavTvShowCubit.get(context);
              if(state is GetAccountsFavoriteTvShowListLoadingState)
                {
                  return const SliverMediaLoadingList();
                }
              if(state is GetAccountsFavoriteTvShowListSuccessState&&cubit.favTvShows.isEmpty)
              {
                return const EmptyAccountList(type: "tv shows");
              }
              if(state is GetAccountsFavoriteTvShowListSuccessState)
                {
                  return TvList(tvList: cubit.favTvShows);
                }
              if(state is GetAccountsFavoriteTvShowListErrorState)
              {
                return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountFavTvShows()));
              }
              return const SliverToBoxAdapter();
            },
          );
        }
    );
  }
}