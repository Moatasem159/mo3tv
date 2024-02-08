part of'../screens/media_gallery_screen.dart';
class _ImageListTitle extends StatelessWidget {
  final String title;
  final int length;
  const _ImageListTitle({required this.title,this.length=0});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(length!=0?"${title.tr(context)!}: $length":title.tr(context)!,
                style: AppTextStyles.get18BoldText()).addSymmetricPadding(h: 11),
        5.ph
      ],
    );
  }
}