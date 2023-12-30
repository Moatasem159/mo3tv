part of 'media_list.dart';
class _ListTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const _ListTitle({required this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr(context)!,style:AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
          if(onPressed!=null)
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.seeMore.tr(context)!,style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
                const Icon(Icons.arrow_forward_ios, size: 15).addPadding(t: 3)
              ],
            ),
          ),
        ],
      ),
    );
  }
}