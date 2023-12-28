part of 'movie_bottom_nav_bar.dart';
class _MovieBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const _MovieBottomNavBarItem({required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => MovieBottomNavCubit.get(context).changeScreen(index),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 5,
            height: 40,
            decoration: BoxDecoration(
                color: MovieBottomNavCubit.get(context).index == index
                    ? Colors.white10
                    : Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        color: MovieBottomNavCubit.get(context).index == index
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        width: 2))),
            child: Icon(icon,
                color: MovieBottomNavCubit.get(context).index == index
                    ? Theme.of(context).primaryColor
                    : Colors.white),
          ),
        );
      },
    );
  }
}