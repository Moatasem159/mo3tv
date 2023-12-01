import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/presentation/widgets/cast_widget/cast_image/cast_image.dart';
class CastMemberWidget extends StatelessWidget {
  final CastMember member;
  const CastMemberWidget({super.key, required this.member});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CastImage(image: member.profilePath),
        Container(
          width: double.maxFinite,
          height: 45,
          decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(child: Text(member.originalName, style: AppTextStyles.get14BoldText())).addSymmetricPadding(h:5),
              FittedBox(child: Text(member.character!=''?member.character:member.job,style: AppTextStyles.get14NormalText())).addSymmetricPadding(h:5)
            ],
          ),
        ),
      ],
    );
  }
}