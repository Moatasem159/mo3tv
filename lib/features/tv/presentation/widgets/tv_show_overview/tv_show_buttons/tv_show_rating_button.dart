import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_events.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_show_actions_state.dart';
class TvShowRatingButton extends StatelessWidget {
  final String listType;
  const TvShowRatingButton({Key? key, this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvActionsBloc, TvShowActionsStates>(
      builder: (context, state) {
        TvActionsBloc bloc=TvActionsBloc.get(context);
        return Tooltip(
          message:"Rated${bloc.tvShow!.tvShowAccountDetails!.ratedValue}!" ,
          child: MediaIconButton(
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
                        initialRating: bloc.tvShow!.tvShowAccountDetails!.ratedValue,
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
                          bloc.tvShow!.tvShowAccountDetails!.ratedValue = value;
                        },
                      ),
                      actions: [
                        IconButton(
                            tooltip: "remove rating",
                            iconSize: 25,
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              bloc.add(RateTvShowEvent(0.0));
                              if(listType=='rated'){
                                AccountListsCubit.get(context).list
                                .removeWhere((element) => element.id == bloc.tvShow!.id);
                                AccountListsCubit.get(context).update();
                              }
                              GoRouter.of(context).pop();
                            }),
                        TextButton(
                          child: const Text('Rate'),
                          onPressed: () {
                            bloc.add(RateTvShowEvent(bloc.tvShow!.tvShowAccountDetails!.ratedValue));
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
            icon: bloc.tvShow!.tvShowAccountDetails!.ratedValue!=0.0 ?
            const Icon(Icons.star_rate_rounded,color: Colors.yellow,size: 30) :
            const Icon(Icons.star_border_rounded,size: 30),
          ),
        );
      },
    );
  }
}