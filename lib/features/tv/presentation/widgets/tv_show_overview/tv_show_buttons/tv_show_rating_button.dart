part of'tv_show_buttons_widget.dart';
class _TvShowRatingButton extends StatelessWidget {
  final String listType;
  const _TvShowRatingButton({this.listType=''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvActionsBloc,TvShowActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="rate")
        {
          CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        TvActionsBloc bloc=TvActionsBloc.get(context);
        return MediaIconButton(
          onTap: () {
            if(AppStrings.sessionId!='')
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
                    elevation: 5,
                    content: RatingBar(
                      itemSize: 27,
                      allowHalfRating: true,
                      glowRadius: 2,
                      initialRating: bloc.tvShow.mediaAccountDetails!.ratedValue,
                      minRating: .5,
                      maxRating: 10,
                      itemCount: 10,
                      glowColor: Colors.yellow,
                      ratingWidget: RatingWidget(
                        full: const Icon(Icons.star_rate_rounded, color: Colors.yellow),
                        empty: const Icon(Icons.star_border_rounded),
                        half: const Icon(Icons.star_half_rounded,color: Colors.yellow),
                      ),
                      onRatingUpdate: (double value) {
                        bloc.tvShow.mediaAccountDetails!.ratedValue = value;
                      },
                    ),
                    actions: [
                      IconButton(
                          iconSize: 25,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            bloc.add(RateTvShowEvent(0.0));
                            if(listType=='rated'){
                              AccountListsCubit.get(context).list
                              .removeWhere((element) => element.id == bloc.tvShow.id);
                              AccountListsCubit.get(context).update();
                            }
                            GoRouter.of(context).pop();
                          }),
                      TextButton(
                        child:Text(AppStrings.rate.tr(context)!),
                        onPressed: () {
                          bloc.add(RateTvShowEvent(bloc.tvShow.mediaAccountDetails!.ratedValue));
                          if(listType=='rated'){
                            AccountListsCubit.get(context).list.add(bloc.tvShow);
                            AccountListsCubit.get(context).update();
                          }
                          GoRouter.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
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
          icon: bloc.tvShow.mediaAccountDetails!.ratedValue!=0.0 ?
          const Icon(Icons.star_rate_rounded,color: Colors.yellow,size: 30) :
          const Icon(Icons.star_border_rounded,size: 30),
        );
      },
    );
  }
}