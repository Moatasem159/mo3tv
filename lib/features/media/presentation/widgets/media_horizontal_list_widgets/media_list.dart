import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_media_list_cubit/get_media_list_cubit.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_list_item.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_list_loading_item.dart';
part 'list_title.dart';
part 'media_error_list.dart';
part 'media_loading_list.dart';
part 'media_horizontal_list.dart';
class MediaList extends StatelessWidget {
  final MediaParams params;
  const MediaList({super.key,required this.params});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMediaListCubit(di.sl(),params)..getMediaList(),
      child: BlocBuilder<GetMediaListCubit, GetMediaListStates>(
        builder: (context, state) {
          if (state is GetMediaListLoadingState) {
            return  _MediaLoadingList(title: params.listTitle);
          }
          if (state is GetMediaListSuccessState) {
            return _MediaHorizontalList(
              media: state.media,
              mediaType: params.mediaType,
              title: params.listTitle,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreMediaRoute,
                  extra: state.media,
                  pathParameters: {"params":params.toJson()});
              },
            );
          }
          if (state is GetMediaListErrorState) {
            return _MediaErrorList(title: params.listTitle,onPressed: () => GetMediaListCubit.get(context).getMediaList());
          }
          return const SizedBox();
        },
      ),
    );
  }
}