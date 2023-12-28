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
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_events.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_state.dart';
part 'movie_fav_button.dart';
part 'movie_rating_button.dart';
part 'add_movie_to_watchlist_button.dart';
class MovieButtonsWidget extends StatefulWidget {
  final Movie movie;
  final String listType;
  const MovieButtonsWidget({super.key,required this.movie, this.listType='?'});
  @override
  State<MovieButtonsWidget> createState() => _MovieButtonsWidgetState();
}
class _MovieButtonsWidgetState extends State<MovieButtonsWidget> with SingleTickerProviderStateMixin{
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
      position: _slideTransition,
      child: Column(
        children: [
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote: widget.movie.voteAverage),
              _MovieFavButton(listType: widget.listType),
              _MovieRatingButton(listType: widget.listType),
              _AddMovieToWatchlistButton(listType: widget.listType),
            ],
          ),
        ],
      ),
    );
  }
}