import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_media_loading_list.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_tv_show_cubit/account_rated_tv_shows_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/rated_tv_show_cubit/account_rated_tv_shows_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
class AccountRatedTvShowsList extends StatelessWidget {
  const AccountRatedTvShowsList({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!AccountRatedTvShowsCubit.get(context).isSuccess()) {
        AccountRatedTvShowsCubit.get(context).getAccountRatedTvShows();
      }
      return BlocBuilder<AccountRatedTvShowsCubit, AccountRatedTvShowsStates>(
        builder: (context, state) {
          AccountRatedTvShowsCubit cubit =
              AccountRatedTvShowsCubit.get(context);
          if (state is GetAccountsRatedTvShowListLoadingState) {
            return const SliverMediaLoadingList();
          }
          if(state is GetAccountsRatedTvShowListSuccessState&&cubit.ratedTvShows.isEmpty)
          {
            return const EmptyAccountList(type: "tv shows");
          }
          if (state is GetAccountsRatedTvShowListSuccessState) {
            return TvList(tvList: cubit.ratedTvShows);
          }
          if (state is GetAccountsRatedTvShowListErrorState) {
            return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountRatedTvShows()));
          }
          return const SliverToBoxAdapter();
        },
      );
    });
  }
}