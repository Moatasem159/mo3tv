import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';

class AddTvShowToWatchlistButton extends StatelessWidget {
  final TvShow tvShow;
  const AddTvShowToWatchlistButton({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TvCubit, TvStates>(
      listener: (context, state) {
        if(state is AddToWatchListSuccessState &&state.statusCode==13)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Removed from watchlist")));
        }
        else if(state is AddToWatchListSuccessState&& state.statusCode==1)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Added to watchlist")));
        }
      },
      child: MediaIconButton(
        onTap: () {
          if (tvShow.tvShowAccountDetails!.watchlist!) {
            BlocProvider.of<TvCubit>(context).addTvShowToWatchList(tvId: tvShow.id!, watchlist: false);
            tvShow.tvShowAccountDetails!.watchlist=false;

          } else {
            BlocProvider.of<TvCubit>(context).addTvShowToWatchList(tvId: tvShow.id!, watchlist: true);
            tvShow.tvShowAccountDetails!.watchlist=true;
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
      )
    );
  }
}
