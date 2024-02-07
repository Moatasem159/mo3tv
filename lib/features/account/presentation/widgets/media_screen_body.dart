part of'../screens/account_media_list_screen.dart';
class _MediaScreenBody extends StatefulWidget {
  final String title;
  final String mediaType;
  final String listType;
  const _MediaScreenBody({required this.title,required this.mediaType,required this.listType});
  @override
  State<_MediaScreenBody> createState() => _MediaScreenBodyState();
}
class _MediaScreenBodyState extends State<_MediaScreenBody> {
   late final ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller=ScrollController();
    controller.addListener(getMoreMedia);
  }
  getMoreMedia() {
    if(controller.position.atEdge){
      if (AccountListsCubit.get(context).page != AccountListsCubit.get(context).totalPage) {
        AccountListsCubit.get(context).page++;
        AccountListsCubit.get(context).getAccountList(listType: widget.listType, mediaType: widget.mediaType);
      }
    }
  }
  @override
  void dispose() {
    controller.removeListener(getMoreMedia);
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        _AccountListsAppBar(widget.title),
        _AccountList(listType: widget.listType,mediaType: widget.mediaType),
        const _AccountListLoading()
      ],
    );
  }
}



