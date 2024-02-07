part of'../screens/account_media_list_screen.dart';
class _EmptyAccountList extends StatelessWidget {
  final String type;
  const _EmptyAccountList(this.type);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.sentiment_dissatisfied_rounded,size: 150),
          10.ph,
           Text(type.tr(context)!,style: AppTextStyles.get18BoldText()),
          10.ph,
           Text(AppStrings.tryAddSome.tr(context)!,style: AppTextStyles.get14NormalText()),
        ],
      ),
    );
  }
}