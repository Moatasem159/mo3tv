import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list_item.dart';
class HorizontalTvShowList extends StatelessWidget {
  final String title;
  final List<TvShow> tvShow;
  final VoidCallback? onPressed;
  const HorizontalTvShowList({Key? key,
    required this.title,
    required this.tvShow, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(title: title, onPressed: onPressed),
        10.ph,
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: tvShow.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return TvShowListItem(tvShow:tvShow[index]);
            }, ),
        ),
        10.ph
      ],
    );
  }
}