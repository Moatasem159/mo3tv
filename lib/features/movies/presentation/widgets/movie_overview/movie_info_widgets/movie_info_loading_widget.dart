import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_loading/info_loading_widget.dart';
class MovieInfoLoadingWidget extends StatelessWidget {
  const MovieInfoLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
          InfoLoadingWidget(),
        ],
      ),
    );
  }
}