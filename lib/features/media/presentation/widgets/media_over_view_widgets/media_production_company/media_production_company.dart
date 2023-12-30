part of 'media_production_company_list.dart';
class _MediaProductionCompany extends StatelessWidget {
  final Network company;
  const _MediaProductionCompany({required this.company});
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
            height:70,
            imageUrl: EndPoints.logoUrl(company.logoPath),
            errorWidget: (context, url, error)=>Image.asset(AppAssets.errorCover)),
          5.ph,
          FittedBox(child: Text(company.name,style: AppTextStyles.get14NormalText())),
        ],
      ),
    );
  }
}