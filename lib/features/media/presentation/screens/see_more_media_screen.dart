import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/widgets/buttons/arrow_up_button.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_more_media_cubit/get_more_media_cubit.dart';
import 'package:mo3tv/features/media/presentation/widgets/see_more_media_widgets/see_more_media_screen_body.dart';
class SeeMoreMediaScreen extends StatefulWidget {
  final MediaParams params;
  final List<Media> media;
  const SeeMoreMediaScreen({super.key, required this.params, required this.media});
  @override
  State<SeeMoreMediaScreen> createState() => _SeeMoreMediaScreenState();
}
class _SeeMoreMediaScreenState extends State<SeeMoreMediaScreen> {
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
  _scrollListener() {
    setState(() {
      showScrollButton = controller.offset >= 100.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetMoreMediaCubit(di.sl(),di.sl(),di.sl(),widget.params),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body:SeeMoreMediaScreenBody(controller: controller, listTitle: widget.params.listTitle, media: widget.media,mediaType: widget.params.mediaType),
          floatingActionButton: showScrollButton ? ArrowUpButton(
                  onTap: () => controller.animateTo(0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.fastLinearToSlowEaseIn)) : null,
        ),
      ),
    );
  }
}