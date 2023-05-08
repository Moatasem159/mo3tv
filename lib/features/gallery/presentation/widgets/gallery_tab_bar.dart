import 'package:flutter/material.dart';
class GalleryTabBar extends StatelessWidget {
  final ValueChanged<int>? onTap;
  const GalleryTabBar({Key? key,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 10,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: const Size(0, 30),
        child: TabBar(
          indicatorWeight: 2,
          indicatorColor: Colors.red,
          labelPadding: const EdgeInsets.only(bottom: 5),
          onTap: onTap,
          tabs: const [
            Text("Backdrops"),
            Text("posters"),
            Text("logos"),
          ],
        ),
      ),
    );
  }
}
