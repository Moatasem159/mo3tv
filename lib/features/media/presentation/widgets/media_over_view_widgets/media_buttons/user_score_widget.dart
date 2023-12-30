part of 'media_buttons_widget.dart';
class _UserScoreWidget extends StatelessWidget {
  final num vote;
  const _UserScoreWidget({required this.vote});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: 21,
          lineWidth: 3,
          percent: vote / 10,
          center: Text(
            "${((vote) * 10).toInt() % 10000}%",
            style:AppTextStyles.get10NormalText()
          ),
          progressColor: Colors.green,
        ),
        5.pw,
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.user.tr(context)!,style:AppTextStyles.get14NormalText()),
            Text(AppStrings.score.tr(context)!,style:AppTextStyles.get14NormalText()),
          ],
        )
      ],
    ).addAllPadding(8);
  }
}