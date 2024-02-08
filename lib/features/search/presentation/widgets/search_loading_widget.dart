part of'../screens/search_screen.dart';
class _SearchLoadingWidget extends StatelessWidget {
  const _SearchLoadingWidget();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          10.ph,
          SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 1,
            ),
          ),
        ],
      ),
    );
  }
}