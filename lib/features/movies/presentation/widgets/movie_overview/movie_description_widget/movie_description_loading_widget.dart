import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/description_loading.dart';
class MovieDescriptionLoadingWidget extends StatelessWidget {
  const MovieDescriptionLoadingWidget({super.key});
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
        DescriptionLoading(),
      ],
    );
  }
}