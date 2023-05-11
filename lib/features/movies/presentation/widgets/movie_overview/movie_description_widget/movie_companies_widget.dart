import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/production_company_widgets/production_company_list_widget.dart';
class MovieProductionCompaniesWidget extends StatelessWidget {
  final List<ProductionCompany> productionCompanies;
  const MovieProductionCompaniesWidget({super.key, required this.productionCompanies});
  @override
  Widget build(BuildContext context) {
    if (productionCompanies.isNotEmpty) {
      return Column(
        children: [
          7.ph,
          ProductionCompanyListWidget(
            productionCompanies: productionCompanies,
          ),
        ],
      );
    }
    return Container();
  }
}