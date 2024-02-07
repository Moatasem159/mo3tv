part of 'media_buttons_widget.dart';
class _MediaRatingButton extends StatelessWidget {
  final String listType;
  const _MediaRatingButton({this.listType = ''});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc, MediaActionsStates>(
      listener: (context, state) {
        if (state is ActionErrorState && state.where == "rate") {
          CustomToast.showToast(context, msg: AppStrings.somethingWentWrong);
        }
      },
      builder: (context, state) {
        MediaActionsBloc bloc = MediaActionsBloc.get(context);
        return MediaIconButton(
            onTap: () {
              if (AppStrings.sessionId != "") {
                showDialog(
                  context: context,
                  builder: (_) {
                    if (listType == "?") {
                      return RateDialog(bloc: bloc, listType: listType);
                    }
                    else {
                      return BlocProvider.value(
                        value: AccountListsCubit.get(context),
                        child: RateDialog(bloc: bloc, listType: listType),
                      );
                    }
                  },
                );
              }
              else {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const LoginAlert();
                  },
                );
              }
            },
            icon: bloc.media.mediaAccountDetails!.ratedValue != 0.0
                ? const Icon(
                Icons.star_rate_rounded, color: Colors.yellow, size: 30)
                : const Icon(Icons.star_border_rounded, size: 30));
      },
    );
  }
}