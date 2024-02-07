part of'media_buttons_widget.dart';
class RateDialog extends StatelessWidget {
  const RateDialog({super.key,required this.bloc,required this.listType});
  final MediaActionsBloc bloc;
  final String listType;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 5),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
      elevation: 5,
      content: RatingBar(
        itemSize: 27,
        allowHalfRating: true,
        glowRadius: 2,
        initialRating:
        bloc.media.mediaAccountDetails!.ratedValue,
        minRating: .5,
        maxRating: 10,
        itemCount: 10,
        glowColor: Colors.yellow,
        ratingWidget: RatingWidget(
          full: const Icon(Icons.star_rate_rounded,
              color: Colors.yellow),
          empty: const Icon(Icons.star_border_rounded),
          half: const Icon(Icons.star_half_rounded,
              color: Colors.yellow),
        ),
        onRatingUpdate: (double value) {
          bloc.media.mediaAccountDetails!.ratedValue = value;
        },
      ),
      actions: [
        IconButton(
          iconSize: 25,
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            bloc.add(RateMediaEvent(0.0));
            if (listType == "rated") {
              AccountListsCubit
                  .get(context)
                  .list
                  .removeWhere(
                      (element) => element.id == bloc.media.id);
              AccountListsCubit.get(context).update();
            }
            context.pop();
          },
        ),
        TextButton(
          child: Text(AppStrings.rate.tr(context)!),
          onPressed: () {
            bloc.add(RateMediaEvent(
                bloc.media.mediaAccountDetails!.ratedValue));
            if (listType == "rated") {
              AccountListsCubit
                  .get(context)
                  .list
                  .add(bloc.media);
              AccountListsCubit.get(context).update();
            }
            context.pop();
          },
        ),
      ],
    );
  }
}