import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
part '../widgets/media_credits_list.dart';
part '../widgets/cast_widget/cast_member_widget.dart';
part '../widgets/media_credits_loading_list.dart';
part '../widgets/cast_widget/cast_image/cast_image.dart';
part '../widgets/cast_widget/cast_image/cast_image_builder.dart';
part '../widgets/cast_widget/cast_image/cast_image_placeholder.dart';
class MediaCredits extends StatelessWidget {
  const MediaCredits({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditsCubit,CreditsStates>(
      builder: (context, state) {
        if (state is GetMediaCreditsSuccessState) {
          return _MediaCreditsList(state.credits);
        }
        if(state is GetMediaCreditsErrorState) {
            return SliverToBoxAdapter(
              child: ErrorButton(onTap: () => CreditsCubit.get(context).getMediaCredits()));
          }
        return const _MediaCreditsLoadingList();
      },
    );
  }
}