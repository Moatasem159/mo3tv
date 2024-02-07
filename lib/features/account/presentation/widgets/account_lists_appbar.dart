part of'../screens/account_media_list_screen.dart';
class _AccountListsAppBar extends StatelessWidget {
  const _AccountListsAppBar(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        leadingWidth: 50,
        toolbarHeight: 50,
        snap: true,
        floating: true,
        stretch: true,
        leading:IconButton(onPressed: context.pop,icon: const Icon(Icons.arrow_back,size: 20)),
        title: Text(title.tr(context)!,style: AppTextStyles.get14BoldText()));
  }
}