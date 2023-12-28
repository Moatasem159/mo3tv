import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/core/widgets/toast/custom_toast.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_alert.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_events.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_show_actions_state.dart';
part 'tv_show_fav_button.dart';
part 'tv_show_rating_button.dart';
part 'add_tv_show_to_watchlist_button.dart';
class TvShowButtonsWidget extends StatefulWidget {
  final TvShow tvShow;
  final  String listType;
  const TvShowButtonsWidget({super.key,required this.tvShow,this.listType=''});
  @override
  State<TvShowButtonsWidget> createState() => _TvShowButtonsWidgetState();
}
class _TvShowButtonsWidgetState extends State<TvShowButtonsWidget> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,6), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:_slideTransition,
      child: Column(
        children: [
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote:widget.tvShow.voteAverage),
              _TvShowFavButton(listType:widget.listType),
              _TvShowRatingButton(listType:widget.listType),
              _AddTvShowToWatchlistButton(listType:widget.listType),
            ],
          ),
        ],
      ),
    );
  }
}