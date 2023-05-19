import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class CreatorWidget extends StatelessWidget {
  final TvShow tvShow;
  const CreatorWidget({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tvShow.createdBy!.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.name!,
                style:
                const TextStyle(fontWeight: FontWeight.bold)),
            const Text("Creator"),
            7.ph
          ],
        );
      }).toList(),
    );
  }
}