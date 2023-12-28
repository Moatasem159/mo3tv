part of 'movie_buttons_widget.dart';
class _MovieRatingButton extends StatelessWidget {
  final String listType;
  const _MovieRatingButton({this.listType=''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieActionsBloc, MovieActionsStates>(
      listener: (context, state) {
        if(state is ActionErrorState&&state.where=="rate")
        {
          CustomToast.showToast(context,msg:AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        MovieActionsBloc bloc=MovieActionsBloc.get(context);
        return MediaIconButton(
          onTap: (){
            if(AppStrings.sessionId!="")
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
                      initialRating: bloc.movie.mediaAccountDetails!.ratedValue,
                      minRating: .5,
                      maxRating: 10,
                      itemCount: 10,
                      glowColor: Colors.yellow,
                      ratingWidget: RatingWidget(
                        full: const Icon(Icons.star_rate_rounded, color: Colors.yellow),
                        empty: const Icon(Icons.star_border_rounded),
                        half: const Icon(Icons.star_half_rounded,
                            color: Colors.yellow),
                      ),
                      onRatingUpdate: (double value) {
                        bloc.movie.mediaAccountDetails!.ratedValue = value;
                      },
                    ),
                    actions: [
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: (){
                          bloc.add(RateMovieEvent(0.0));
                          if(listType=="rated") {
                            AccountListsCubit.get(context).list
                            .removeWhere((element) => element.id == bloc.movie.id);
                            AccountListsCubit.get(context).update();
                          }
                          GoRouter.of(context).pop();
                        },
                      ),
                      TextButton(
                        child:Text(AppStrings.rate.tr(context)!),
                        onPressed: (){
                          bloc.add(RateMovieEvent(bloc.movie.mediaAccountDetails!.ratedValue));
                          if(listType=="rated") {
                            AccountListsCubit.get(context).list.add(bloc.movie);
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
          icon: bloc.movie.mediaAccountDetails!.ratedValue != 0.0
              ? const Icon(Icons.star_rate_rounded,color: Colors.yellow,size: 30)
              : const Icon(Icons.star_border_rounded,size: 30));
      },
    );
  }
}