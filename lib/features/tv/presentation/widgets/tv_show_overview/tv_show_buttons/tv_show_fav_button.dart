import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';

class TvShowFavButton extends StatelessWidget {
  final TvShow tvShow;
  const TvShowFavButton({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TvCubit, TvStates>(
      listener: (context, state) {
        if(state is FavTvShowSuccessState &&state.statusCode==13)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Removed from favourites")));
        }
        else if(state is FavTvShowSuccessState&& state.statusCode==1)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Added to favourites")));
        }
      },
      child: MediaIconButton(
            onTap:() {
              if(tvShow.tvShowAccountDetails!.favorite!){
                BlocProvider.of<TvCubit>(context).favTvShow(tvId: tvShow.id!, fav: false);
                tvShow.tvShowAccountDetails!.favorite =false;
              }
              else{
                BlocProvider.of<TvCubit>(context).favTvShow(tvId: tvShow.id!, fav: true);
                tvShow.tvShowAccountDetails!.favorite =true;
              }
            },
          icon:Icon(
            Icons.favorite,
            color: tvShow.tvShowAccountDetails!.favorite!?Colors.red:Colors.white
          ),
        ),
    );
  }
}
