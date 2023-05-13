import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/fav_tv_show_cubit/account_fav_tv_show_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowFavButton extends StatelessWidget {
  final TvShow tvShow;
  const TvShowFavButton({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit=TvCubit.get(context);
        return MediaIconButton(
          onTap:() {
            if(AppStrings.sessionId!='')
            {
              if(tvShow.tvShowAccountDetails!.favorite!){
                cubit.favTvShow(tvId: tvShow.id!, fav: false);
                tvShow.tvShowAccountDetails!.favorite =false;
                AccountFavTvShowCubit.get(context).favTvShows.removeWhere((element) => element.id==tvShow.id);
                AccountFavTvShowCubit.get(context).update();
              }
              else{
                cubit.favTvShow(tvId: tvShow.id!, fav: true);
                tvShow.tvShowAccountDetails!.favorite =true;
                AccountFavTvShowCubit.get(context).favTvShows.add(tvShow);
                AccountFavTvShowCubit.get(context).update();
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
          icon:Icon(
              Icons.favorite,
              color: tvShow.tvShowAccountDetails!.favorite!?Colors.red:Colors.white
          ),
        );
      },
    );
  }
}
