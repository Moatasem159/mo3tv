import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
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
        SliverAppBar(
          leadingWidth: 50,
          toolbarHeight: 50,
          snap: true,
          floating: true,
          stretch: true,
          leading:IconButton(onPressed:context.pop, icon: const Icon(Icons.arrow_back,size: 20)),
          title: Text(listTitle.tr(context)!,style: AppTextStyles.get14BoldText()),
        ),
        BlocBuilder<GetMoreMediaCubit, GetMoreMediaStates>(
          builder: (context, state) {
            GetMoreMediaCubit cubit = GetMoreMediaCubit.get(context);
            if (cubit.mediaList.isEmpty) {
              cubit.mediaList.addAll(media);
            }
            return MediaVerticalList(mediaList: cubit.mediaList, mediaType: mediaType);
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