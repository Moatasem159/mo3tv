import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_screen_body.dart';
class SimilarMoviesScreen extends StatefulWidget {
  final List<Movie> recommendations;
  final int movieId;
  const SimilarMoviesScreen({Key? key, required this.recommendations, required this.movieId}) : super(key: key);
  @override
  State<SimilarMoviesScreen> createState() => _SimilarMoviesScreenState();
}
class _SimilarMoviesScreenState extends State<SimilarMoviesScreen> {
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SimilarMoviesScreenBody(recommendations: widget.recommendations, movieId: widget.movieId, controller: controller),
        floatingActionButton: showScrollButton
            ? SizedBox(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            onPressed: () {
              controller.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn);
            },
            child: const Icon(Icons.arrow_upward_outlined),
          ),
        ): null,
      ),
    );
  }
}