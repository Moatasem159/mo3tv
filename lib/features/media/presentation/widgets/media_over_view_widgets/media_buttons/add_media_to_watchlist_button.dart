part of 'media_buttons_widget.dart';
class _AddMediaToWatchlistButton extends StatelessWidget {
  final String listType;
  const _AddMediaToWatchlistButton({this.listType=''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc,MediaActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="watchList")
        {
        CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        MediaActionsBloc bloc=MediaActionsBloc.get(context);
        return MediaIconButton(
          onTap: (){
            if(AppStrings.sessionId!='')
            {
              if(bloc.media.mediaAccountDetails!.watchlist==true)
                {
                  bloc.media.mediaAccountDetails!.watchlist=false;
                  bloc.add(WatchListMediaEvent(false));
                  if(listType=="watchlist")
                  {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.media.id);
                    AccountListsCubit.get(context).update();
                  }
                }
              else{
                bloc.media.mediaAccountDetails!.watchlist=true;
                if(listType=="watchlist")
                {
                  AccountListsCubit.get(context).list.add(bloc.media);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(WatchListMediaEvent(true));
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
          icon: bloc.media.mediaAccountDetails!.watchlist
              ? const Icon(Icons.bookmark_rounded, color: Colors.green)
              : const Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }
}