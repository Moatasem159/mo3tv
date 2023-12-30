import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/data/models/network_model.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
part 'media_production_company.dart';
class MediaProductionCompanyList extends StatelessWidget {
  final List<Network> productionCompanies;
  const MediaProductionCompanyList({super.key, required this.productionCompanies});
  @override
  Widget build(BuildContext context) {
    if(productionCompanies.isNotEmpty)
      {
        return Column(
          children: [
            Center(child: Text(AppStrings.productionCompanies.tr(context)!,style:AppTextStyles.get14BoldText(),)),
            Wrap(
              alignment: WrapAlignment.center,
              children: productionCompanies.map((e)=> _MediaProductionCompany(company: e)).toList(),
            ),
          ],
        );
      }
  return const SizedBox();
  }
}