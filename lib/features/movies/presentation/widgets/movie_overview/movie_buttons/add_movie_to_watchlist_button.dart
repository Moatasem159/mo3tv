part of 'movie_buttons_widget.dart';
class _AddMovieToWatchlistButton extends StatelessWidget {
  final String listType;
  const _AddMovieToWatchlistButton({this.listType=''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieActionsBloc,MovieActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="watchList")
        {
        CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        MovieActionsBloc bloc=MovieActionsBloc.get(context);
        return MediaIconButton(
          onTap: (){
            if(AppStrings.sessionId!='')
            {
              if(bloc.movie.mediaAccountDetails!.watchlist==true)
                {
                  bloc.movie.mediaAccountDetails!.watchlist=false;
                  bloc.add(WatchListMovieEvent(false));
                  if(listType=="watchlist")
                  {
                    AccountListsCubit.get(context).list
                    .removeWhere((element) => element.id==bloc.movie.id);
                    AccountListsCubit.get(context).update();
                  }
                }
              else{
                bloc.movie.mediaAccountDetails!.watchlist=true;
                if(listType=="watchlist")
                {
                  AccountListsCubit.get(context).list.add(bloc.movie);
                  AccountListsCubit.get(context).update();
                }
                bloc.add(WatchListMovieEvent(true));
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
          icon: bloc.movie.mediaAccountDetails!.watchlist
              ? const Icon(Icons.bookmark_rounded, color: Colors.green)
              : const Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }
}