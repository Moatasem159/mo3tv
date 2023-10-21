import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
class ProductionCompanyWidget extends StatelessWidget {
  final ProductionCompany company;
  const ProductionCompanyWidget({super.key, required this.company});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CachedNetworkImage(
            width: 90,
            height: 70,
            imageUrl: EndPoints.logoUrl(company.logoPath),
            errorWidget: (context, url, error)=>Image.asset(AppAssets.errorCover)),
           5.ph,
          FittedBox(child: Text(company.name,style: AppTextStyles.get14NormalText())),
        ],
      ),
    );
  }
}