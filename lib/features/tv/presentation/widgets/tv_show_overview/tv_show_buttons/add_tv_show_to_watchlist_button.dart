part of'tv_show_buttons_widget.dart';
class _AddTvShowToWatchlistButton extends StatelessWidget {
  final String listType;
  const _AddTvShowToWatchlistButton({this.listType=''});
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
              if(bloc.tvShow.mediaAccountDetails!.watchlist==true)
                {
                  bloc.tvShow.mediaAccountDetails!.watchlist=false;
                  bloc.add(WatchListTvShowEvent(false));
                  if(listType=="watchlist")
                  {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.tvShow.id);
                    AccountListsCubit.get(context).update();
                  }
                }
              else{
                bloc.tvShow.mediaAccountDetails!.watchlist=true;
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
          icon: bloc.tvShow.mediaAccountDetails!.watchlist?
          const Icon(Icons.bookmark_rounded,color: Colors.green):
          const Icon(Icons.bookmark_add_outlined));
      },
    );
  }
}
