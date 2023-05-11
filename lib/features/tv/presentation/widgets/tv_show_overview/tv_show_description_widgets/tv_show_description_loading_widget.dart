import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_loading/description_loading.dart';
class TvShowDescriptionLoadingWidget extends StatelessWidget {
  const TvShowDescriptionLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
        DescriptionLoading(),
      ],
    );
  }
}