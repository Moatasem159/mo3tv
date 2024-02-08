import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_cubit.dart';
part '../widgets/image_list.dart';
part '../widgets/gallery_image.dart';
part '../widgets/image_list_title.dart';
part '../widgets/empty_image_list.dart';
part '../widgets/gallery_image_list.dart';
part '../widgets/gallery_loading_body.dart';
part '../widgets/gallery_success_body.dart';
part '../widgets/gallery_image_loading.dart';
class MediaGalleryScreen extends StatelessWidget {
  final String mediaType;
  const MediaGalleryScreen({super.key, required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryStates>(
      builder: (_, state) {
        if(state is GetMediaGallerySuccessState&&GalleryCubit.get(context).isEmpty){
            return const _EmptyGallery();
          }
        if (state is GetMediaGallerySuccessState) {
          return _GallerySuccessBody(mediaType: mediaType,gallery: state.gallery);
        }
        if(state is GetMediaGalleryErrorState){
          return SliverToBoxAdapter(
              child: ErrorButton(onTap: () => GalleryCubit.get(context).getMediaGallery()));
        }
        return const _GalleryLoadingBody();
      },
    );
  }
}