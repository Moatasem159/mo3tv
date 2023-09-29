import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/buttons/arrow_up_button.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_screen_body.dart';
class SimilarTvShowsScreen extends StatefulWidget {
  final List<TvShow> recommendations;
  final int tvId;
  const SimilarTvShowsScreen({Key? key, required this.recommendations, required this.tvId}) : super(key: key);

  @override
  State<SimilarTvShowsScreen> createState() => _SimilarTvShowsScreenState();
}
class _SimilarTvShowsScreenState extends State<SimilarTvShowsScreen> {
  final ScrollController controller = ScrollController();
  bool showScrollButton = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }
  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }
  void _scrollListener() {
    setState(() {
      showScrollButton = controller.offset >= 100.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).colorScheme.background,
        body: SimilarTvShowsScreenBody(
          controller: controller,
            recommendations: widget.recommendations, tvId: widget.tvId),
        floatingActionButton: showScrollButton
        ? ArrowUpButton(onTap: () => controller.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn)): null,
      ),
    );
  }
}