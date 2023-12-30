part of 'media_info.dart';
class _NameWidget extends StatelessWidget {
  final String title;
  final String releaseDate;
  const _NameWidget({required this.title, required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Text(
        "$title ${releaseDate == "" ? '' : ((releaseDate.substring(0, 4)))}",
        maxLines: null,
        overflow: TextOverflow.visible,
        style:AppTextStyles.get14BoldText(height: 0));
  }
}