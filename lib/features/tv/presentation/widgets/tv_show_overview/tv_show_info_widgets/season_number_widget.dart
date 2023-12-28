part of 'tv_show_info_widget.dart';
class _SeasonNumberWidget extends StatelessWidget {
  final TvShow tvShow;
  const _SeasonNumberWidget({required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tvShow.seasons.isEmpty && tvShow.numberOfSeasons == 1)
          Text("${tvShow.numberOfSeasons} ${AppStrings.season.tr(context)!}",style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons.isEmpty && tvShow.numberOfSeasons > 1)
          Text("${tvShow.numberOfSeasons} ${AppStrings.seasons.tr(context)!}",style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons.length > 1)
          Text("${tvShow.seasons.length} ${AppStrings.seasons.tr(context)!}", style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons.length == 1)
          Text("${tvShow.seasons.length} ${AppStrings.season.tr(context)!}",style:AppTextStyles.get14BoldText()),
      ],
    );
  }
}