import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/production_company_widgets/production_company_widget.dart';
class ProductionCompanyListWidget extends StatelessWidget {
  final List<ProductionCompany> productionCompanies;
  const ProductionCompanyListWidget({super.key, required this.productionCompanies});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Center(child: Text(AppStrings.productionCompanies.tr(context)!,style:AppTextStyles.get14BoldText(),)),
         Wrap(
          alignment: WrapAlignment.center,
          children: productionCompanies.map((e)=> ProductionCompanyWidget(company: e)).toList(),
        ),
      ],
    );
  }
}