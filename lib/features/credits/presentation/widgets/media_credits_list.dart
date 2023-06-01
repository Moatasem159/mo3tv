import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/widgets/cast_widget.dart';
class MediaCreditsList extends StatelessWidget {
  final List<CastMember> mediaCredits;
  const MediaCreditsList({Key? key, required this.mediaCredits}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${AppStrings.cast.tr(context)!} :${mediaCredits.length}"
                ,style: AppTextStyles.get18BoldText(height: 0)).addSymmetricPadding(h:11),
                5.ph
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: mediaCredits.length,
                  (context, index) {
                return CastMemberWidget(
                    member:mediaCredits[index]);
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
          ),
           SliverToBoxAdapter(child: 10.ph)
        ],
      ),
    );
  }
}