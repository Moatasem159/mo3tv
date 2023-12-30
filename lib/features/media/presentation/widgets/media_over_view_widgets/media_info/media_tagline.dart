part of 'media_info.dart';
class _TaglineWidget extends StatelessWidget {
  final String tagline;
  const _TaglineWidget({required this.tagline});
  @override
  Widget build(BuildContext context) {
    if (tagline != "") {
      return Column(
        children: [
          Text(tagline,
              maxLines: null,
              overflow: TextOverflow.visible,
              style: AppTextStyles.get14BoldText(color: Colors.grey[600]!)),
        ],
      );
    }
    return Container();
  }
}