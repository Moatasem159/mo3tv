import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_details_appbar.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_media_details_cubit/get_media_details_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_more_media_cubit/get_more_media_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_bottomnav_cubit/media_bottom_nav_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_buttons_bloc/media_actions_bloc.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_bottom_nav_bar_widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
class MediaDetailsScreen extends StatelessWidget {
  final Media media;
  final String listType;
  final String mediaType;
  const MediaDetailsScreen({super.key, required this.media,this.listType='?', required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MediaBottomNavCubit()..media = media..params = MediaParams(
          mediaType: mediaType,listType: listType
        )..initScreens()),
        BlocProvider(create: (context) => GetMediaDetailsCubit(di.sl(),di.sl(),MediaParams(mediaId: media.id,mediaType: mediaType))..getMovieDetailsData()),
        BlocProvider(create: (context) => GalleryNavigatorCubit()..mediaType=mediaType..initGallery()),
        BlocProvider(create: (context) => MediaActionsBloc(di.sl(), di.sl(), di.sl())),
        BlocProvider(create: (context) => GalleryCubit(di.sl())..mediaId=media.id..mediaType=mediaType..getMediaGallery()),
        BlocProvider(create: (context) => ReviewsCubit(di.sl())..mediaId=media.id..mediaType=mediaType..getMediaReviews()),
        BlocProvider(create: (context) => CreditsCubit(di.sl())..mediaId=media.id..mediaType=mediaType..getMediaCredits()),
        BlocProvider( create: (context)=> GetMoreMediaCubit(
            di.sl(),
            di.sl(),
            MediaParams(mediaId: media.id,mediaType:mediaType,moreType: AppStrings.recommendations)
        )..getMoreMedia()),
      ],
      child: BlocBuilder<MediaBottomNavCubit, MediaBottomNavStates>(
        builder: (context, state) {
          MediaBottomNavCubit cubit = MediaBottomNavCubit.get(context);
          return PopScope(
            canPop: cubit.index==0?true:false,
            onPopInvoked: (didPop) async {
              cubit.changeScreen(0);
            },
            child: DefaultTabController(
              length: 3,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  bottomNavigationBar: const MediaBottomNavbar(),
                  body: NestedScrollView(
                    controller: cubit.nestedController,
                    physics: const ClampingScrollPhysics(),
                    scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverOverlapAbsorber(
                        handle: cubit.appBar,
                        sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: MediaDetailsAppBar(
                            mediaType: mediaType,
                            media: media,
                            onTap: cubit.resetList,
                            onBackTap: () {
                              if (cubit.index != 0) {
                                cubit.changeScreen(0);
                              } else {
                                context.pop();
                              }
                            },
                          ),
                        ),
                      ),
                      if (cubit.isGallery)
                      SliverOverlapAbsorber(handle: cubit.disconnectBar, sliver: const GalleryTabBar()),
                    ],
                    body: CustomScrollView(
                      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
                      slivers: [
                        SliverOverlapInjector(handle: cubit.appBar),
                        if (cubit.isGallery)
                        SliverOverlapInjector(handle: cubit.disconnectBar),
                        SliverToBoxAdapter(child: 15.ph),
                        cubit.screens[cubit.index],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}