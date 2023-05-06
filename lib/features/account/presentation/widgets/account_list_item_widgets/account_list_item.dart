import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/account/presentation/screens/media_list_screen.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_item_widgets/item_widget.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_item_widgets/loading_item.dart';
class AccountListItem extends StatelessWidget {
  const AccountListItem({
    super.key,
    required this.favMovies,
    required this.ratedMovies,
    required this.favTv,
    required this.ratedTv,
    required this.tvWatchlist,
    required this.moviesWatchlist,
    required this.title,
    required this.list,
  });
  final bool favMovies;
  final bool ratedMovies;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  final bool moviesWatchlist;
  final String title;
  final List list;
  @override
  Widget build(BuildContext context) {
    final random = Random();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MediaListScreen(
              favMovies: favMovies,
              ratedMovies: ratedMovies,
              favTv: favTv,
              ratedTv: ratedTv,
              tvWatchlist: tvWatchlist,
              moviesWatchlist: moviesWatchlist,
              title: title,
            ),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: EndPoints.backDropsUrl(list[random.nextInt(list.length)].backdropPath!),
        imageBuilder: (context, imageProvider) => ItemWidget(title: title, list: list, imageProvider: imageProvider),
        placeholder: (context, url) => const LoadingItem(),
      ),
    );
  }
}