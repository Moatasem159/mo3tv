import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/info_loading_widget.dart';
class TvShowInfoLoadingWidget extends StatelessWidget {
  const TvShowInfoLoadingWidget({super.key});
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