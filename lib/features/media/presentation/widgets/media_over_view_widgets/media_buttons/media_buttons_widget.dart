import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/core/widgets/toast/custom_toast.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_alert.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_buttons_bloc/media_actions_bloc.dart';
part 'media_fav_button.dart';
part 'user_score_widget.dart';
part 'media_rating_button.dart';
part 'add_media_to_watchlist_button.dart';
part 'rating_dailog.dart';
class MediaButtonsWidget extends StatefulWidget {
  final Media movie;
  final String listType;
  const MediaButtonsWidget({super.key,required this.movie, this.listType='?'});
  @override
  State<MediaButtonsWidget> createState() => _MediaButtonsWidgetState();
}
class _MediaButtonsWidgetState extends State<MediaButtonsWidget> with SingleTickerProviderStateMixin{
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
              _UserScoreWidget(vote: widget.movie.voteAverage),
              _MediaFavButton(listType: widget.listType),
              _MediaRatingButton(listType: widget.listType),
              _AddMediaToWatchlistButton(listType: widget.listType),
            ],
          ),
        ],
      ),
    );
  }
}