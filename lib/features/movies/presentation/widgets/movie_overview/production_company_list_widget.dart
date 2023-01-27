import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/production_company_widget.dart';

class ProductionCompanyListWidget extends StatelessWidget {
  final List<ProductionCompany> productionCompanies;
  const ProductionCompanyListWidget({Key? key, required this.productionCompanies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Text("Production Companies",
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),)),
        const SizedBox(
          height: 7,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: productionCompanies.map((e)=> ProductionCompanyWidget(company: e,)
          ).toList(),
        ),
      ],
    );
  }
}