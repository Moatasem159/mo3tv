import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/sliver_loading_indicator.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_more_media_cubit/get_more_media_cubit.dart';
class SeeMoreMediaScreenBody extends StatelessWidget {
  final String listTitle;
  final List<Media> media;
  final String mediaType;
  final ScrollController controller;
  const SeeMoreMediaScreenBody({super.key, required this.controller, required this.listTitle, required this.media, required this.mediaType,});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        CustomAppBar(
          title: listTitle.tr(context)!,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SliverToBoxAdapter(child: 7.ph),
        BlocBuilder<GetMoreMediaCubit, GetMoreMediaStates>(
          builder: (context, state) {
            GetMoreMediaCubit cubit = GetMoreMediaCubit.get(context);
            if (cubit.mediaList.isEmpty) {
              cubit.mediaList.addAll(media);
            }
            return MediaVerticalList(
                mediaList: cubit.mediaList, mediaType: mediaType);
          },
        ),
        BlocBuilder<GetMoreMediaCubit, GetMoreMediaStates>(
          builder: (context, state) {
            if (state is GetMoreMediaLoadingState) {
              return const SliverLoadingIndicator();
            }
            return SeeMoreButton(onPressed: GetMoreMediaCubit.get(context).getMoreMedia);
          },
        ),
      ],
    );
  }
}