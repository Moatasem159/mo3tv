part of 'tv_show_info_widget.dart';
class _CreatorWidget extends StatelessWidget {
  final TvShow tvShow;
  const _CreatorWidget({required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tvShow.createdBy.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.name!,style: AppTextStyles.get14BoldText()),
            Text(AppStrings.creator,style: AppTextStyles.get14NormalText()),
          ],
        );
      }).toList(),
    );
  }
}