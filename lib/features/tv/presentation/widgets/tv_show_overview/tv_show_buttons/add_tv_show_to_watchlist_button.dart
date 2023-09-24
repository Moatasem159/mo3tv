import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/core/widgets/toast/custom_toast.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_events.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_show_actions_state.dart';
class AddTvShowToWatchlistButton extends StatelessWidget {
  final String listType;
  const AddTvShowToWatchlistButton({Key? key, this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvActionsBloc,TvShowActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="watchList")
        {
          CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        TvActionsBloc bloc=TvActionsBloc.get(context);
        return MediaIconButton(
          onTap: () {
            if(AppStrings.sessionId!=''){
              if(bloc.tvShow.tvShowAccountDetails!.watchlist==true)
                {
                  bloc.tvShow.tvShowAccountDetails!.watchlist=false;
                  bloc.add(WatchListTvShowEvent(false));
                  if(listType=="watchlist")
                  {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.tvShow.id);
                    AccountListsCubit.get(context).update();
                  }
                }
              else{
                bloc.tvShow.tvShowAccountDetails!.watchlist=true;
                if(listType=="watchlist")
                {
                  AccountListsCubit.get(context).list.add(bloc.tvShow);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(WatchListTvShowEvent(true));
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
          icon: bloc.tvShow.tvShowAccountDetails!.watchlist!?
          const Icon(Icons.bookmark_rounded,color: Colors.green):
          const Icon(Icons.bookmark_add_outlined));
      },
    );
  }
}
