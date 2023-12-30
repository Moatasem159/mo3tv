part of 'tv_show_info_widget.dart';
class _TypeWidget extends StatelessWidget {
  final String type;
  const _TypeWidget({required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.type.tr(context)!,style: AppTextStyles.get14BoldText()),
        Text(type,style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}