part of'tv_show_buttons_widget.dart';
class _TvShowFavButton extends StatelessWidget {
  final String listType;
  const _TvShowFavButton({this.listType=''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvActionsBloc, TvShowActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="fav")
        {
          CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        TvActionsBloc bloc=TvActionsBloc.get(context);
        return MediaIconButton(
          onTap:() {
            if(AppStrings.sessionId!='')
            {
              if(bloc.tvShow.mediaAccountDetails!.favorite==true)
                {
                  bloc.tvShow.mediaAccountDetails!.favorite=false;
                  if(listType=="favorite"){
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id == bloc.tvShow.id);
                    AccountListsCubit.get(context).update();
                  }
                  bloc.add(FavTvShowEvent(false));
                }
              else{
                bloc.tvShow.mediaAccountDetails!.favorite=true;
                if(listType=="favorite"){
                  AccountListsCubit.get(context).list.add(bloc.tvShow);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(FavTvShowEvent(true));
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
          icon:Icon(Icons.favorite_rounded,
              color: bloc.tvShow.mediaAccountDetails!.favorite?Colors.red:Colors.white));
      },
    );
  }
}