import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_item_widgets/account_list_item.dart';
import 'package:mo3tv/features/account/presentation/widgets/empty_account_list.dart';
class AccountListWidget extends StatelessWidget {
  final List list;
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  const AccountListWidget({Key? key,
    required this.list,
    required this.title,
    this.favMovies = false,
    this.ratedMovies = false,
    this.moviesWatchlist = false,
    this.favTv = false,
    this.ratedTv = false,
    this.tvWatchlist = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(list.isNotEmpty){
      return AccountListItem(
          favMovies: favMovies,
          ratedMovies: ratedMovies,
          favTv: favTv,
          ratedTv: ratedTv,
          tvWatchlist: tvWatchlist,
          moviesWatchlist: moviesWatchlist,
          title: title,
          list: list,
      );
    }
    if(list.isEmpty){
      return EmptyAccountList(title:title);
    }
    return Container();
  }
}