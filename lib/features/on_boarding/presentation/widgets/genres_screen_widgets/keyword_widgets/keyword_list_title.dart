part of'../../../screens/genres_screen.dart';
class _KeywordListTitle extends StatelessWidget {
  final String title;
  const _KeywordListTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        child: Text(title.tr(context)!,style: AppTextStyles.get18BoldText(height: 0)));
  }
}