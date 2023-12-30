part of 'media_buttons_widget.dart';
class _MediaFavButton extends StatelessWidget {
  final String listType;
  const _MediaFavButton({this.listType='?'});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc,MediaActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="fav")
          {
            CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
          }
      },
      builder: (context, state) {
        MediaActionsBloc bloc=MediaActionsBloc.get(context);
        return MediaIconButton(
          onTap:(){
            if(AppStrings.sessionId!="")
            {
              if(bloc.media.mediaAccountDetails!.favorite==true)
                {
                  bloc.media.mediaAccountDetails!.favorite =false;
                  if(listType=="favorite") {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.media.id);
                    AccountListsCubit.get(context).update();
                  }
                  bloc.add(FavMediaEvent(false));
                }
              else{
                bloc.media.mediaAccountDetails!.favorite=true;
                if(listType=="favorite") {
                  AccountListsCubit.get(context).list.add(bloc.media);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(FavMediaEvent(true));
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
          icon: Icon(Icons.favorite_rounded,
              color:bloc.media.mediaAccountDetails!.favorite?Colors.red:Colors.white));
      },
    );
  }
}