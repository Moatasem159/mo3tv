import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_loading/description_loading.dart';
class TvShowDescriptionLoadingWidget extends StatelessWidget {
  const TvShowDescriptionLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
      ],
    );
  }
}