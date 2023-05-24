import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
class CastMemberWidget extends StatelessWidget {
  final CastMember member;
  const CastMemberWidget({Key? key, required this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  EndPoints.posterUrl(member.profilePath!),
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 140,
            height: 45,
            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FittedBox(
                      child: Text(
                        member.originalName!,
                        style: AppTextStyles.get14BoldText(),
                      )),
                ),
                if(member.character!='')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FittedBox(child: Text(member.character!,style: AppTextStyles.get14NormalText(),)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}