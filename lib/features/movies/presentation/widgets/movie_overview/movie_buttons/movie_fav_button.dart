part of 'movie_buttons_widget.dart';
class _MovieFavButton extends StatelessWidget {
  final String listType;
  const _MovieFavButton({this.listType='?'});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieActionsBloc,MovieActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="fav")
          {
            CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
          }
      },
      builder: (context, state) {
        MovieActionsBloc bloc=MovieActionsBloc.get(context);
        return MediaIconButton(
          onTap:(){
            if(AppStrings.sessionId!="")
            {
              if(bloc.movie.mediaAccountDetails!.favorite==true)
                {
                  bloc.movie.mediaAccountDetails!.favorite =false;
                  if(listType=="favorite") {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.movie.id);
                    AccountListsCubit.get(context).update();
                  }
                  bloc.add(FavMovieEvent(false));
                }
              else{
                bloc.movie.mediaAccountDetails!.favorite=true;
                if(listType=="favorite") {
                  AccountListsCubit.get(context).list.add(bloc.movie);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(FavMovieEvent(true));
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
              color:bloc.movie.mediaAccountDetails!.favorite?Colors.red:Colors.white));
      },
    );
  }
}