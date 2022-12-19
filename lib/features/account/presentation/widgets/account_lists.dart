import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_loading_widget.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_widget.dart';

class AccountLists extends StatelessWidget {
  const AccountLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
  listener: (context, state) {},
  builder: (context, state) {
    AccountCubit cubit =BlocProvider.of<AccountCubit>(context);
    if(state is GetAccountsListsSuccessState||(
        cubit.favTvShows !=null||
        cubit.favMovies!=null||
        cubit.ratedMovies!=null||
        cubit.ratedTvShows!=null||
        cubit.moviesWatchlist!=null||
        cubit.tvShowsWatchlist!=null
    )){
      return SliverToBoxAdapter(
        child: Column(
          children: [
            AccountListWidget(list: cubit.favMovies!, title: "Favorite Movies",favMovies: true),
            AccountListWidget(list: cubit.moviesWatchlist!, title: "Movie Watchlist",moviesWatchlist: true,),
            AccountListWidget(list: cubit.ratedMovies!, title: "Rated Movies",ratedMovies: true),
            AccountListWidget(list: cubit.favTvShows!, title: "Favorite Series",favTv: true,),
            AccountListWidget(list: cubit.tvShowsWatchlist!, title: "Series WatchList",tvWatchlist: true,),
            AccountListWidget(list: cubit.ratedTvShows!, title: "Rated Series",ratedTv: true,)],
        ),
      );
    }
    if(state is !GetAccountsListsSuccessState)
      {
        return const AccountLoadingListWidget();
      }
    return const SliverToBoxAdapter();

  },
);
  }
}
