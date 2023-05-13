import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/tv_show_watchlist/account_tv_show_watchlist_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class AddTvShowToWatchlistButton extends StatelessWidget {
  final TvShow tvShow;
  const AddTvShowToWatchlistButton({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit=TvCubit.get(context);
        return MediaIconButton(
          onTap: () {
            if(AppStrings.sessionId!='')
            {
              if (tvShow.tvShowAccountDetails!.watchlist!) {
                cubit.addTvShowToWatchList(tvId: tvShow.id!, watchlist: false);
                tvShow.tvShowAccountDetails!.watchlist=false;
                AccountTvShowWatchlistCubit.get(context).tvShowsWatchlist.removeWhere((element) => element.id==tvShow.id);
                AccountTvShowWatchlistCubit.get(context).update();
              }
              else {
                cubit.addTvShowToWatchList(tvId: tvShow.id!, watchlist: true);
                tvShow.tvShowAccountDetails!.watchlist=true;
                AccountTvShowWatchlistCubit.get(context).tvShowsWatchlist.add(tvShow);
                AccountTvShowWatchlistCubit.get(context).update();
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
          icon: tvShow.tvShowAccountDetails!.watchlist!?
          const Icon(
            Icons.bookmark,
            color: Colors.green,
          ) :
          const Icon(
            Icons.bookmark_add_outlined,
          ) ,
        );
      },
    );
  }
}
