part of 'media_info.dart';
class _StatusWidget extends StatelessWidget {
  final String status;
  const _StatusWidget({required this.status});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.status.tr(context)!,style: AppTextStyles.get14BoldText()),
        Text(status,style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}