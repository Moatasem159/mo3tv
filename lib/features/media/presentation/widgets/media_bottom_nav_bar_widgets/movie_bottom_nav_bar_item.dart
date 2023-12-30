part of 'media_bottom_nav_bar.dart';
class _MediaBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const _MediaBottomNavBarItem({required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBottomNavCubit, MediaBottomNavStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => MediaBottomNavCubit.get(context).changeScreen(index),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 5,
            height: 40,
            decoration: BoxDecoration(
                color: MediaBottomNavCubit.get(context).index == index
                    ? Colors.white10
                    : Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        color: MediaBottomNavCubit.get(context).index == index
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        width: 2))),
            child: Icon(icon,
                color: MediaBottomNavCubit.get(context).index == index
                    ? Theme.of(context).primaryColor
                    : Colors.white),
          ),
        );
      },
    );
  }
}