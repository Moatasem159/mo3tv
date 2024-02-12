part of'../../screens/genres_screen.dart';
class _FinishButton extends StatefulWidget {
  const _FinishButton();
  @override
  State<_FinishButton> createState() => _FinishButtonState();
}
class _FinishButtonState extends State<_FinishButton> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations = CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0, 50), end: Offset.zero).animate(_curveAnimations);
    Future.delayed(const Duration(milliseconds:700)).then((_){
      _slideController.forward();
    });
  }
  @override
  void dispose() {
    _slideController.dispose();
    _curveAnimations.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideTransition,
      child: BlocConsumer<GenresCubit, GenresState>(
        listener: (context, state) {
          if (state is SaveGenresSuccessState) {
            context.goNamed(Routes.movieRoute);
          }
        },
        builder: (context, state) {
          GenresCubit cubit = GenresCubit.get(context);
          if (state is SaveGenresLoadingState) {
            return const CircularProgressIndicator(strokeWidth: 1,color: Colors.white);
          }
          return MainButton(
              onPressed: (cubit.movieGenres.isNotEmpty && cubit.tvGenres.isNotEmpty)
                  ? cubit.saveList
                  : null,
              radius: 10,
              color: (cubit.movieGenres.isNotEmpty && cubit.tvGenres.isNotEmpty)
                  ? Colors.blue
                  : Colors.white70,
              overlayColor: Colors.white24,
              textStyle: AppTextStyles.get18BoldText(
                  height: 0,
                  color: (cubit.movieGenres.isNotEmpty && cubit.tvGenres.isNotEmpty)
                      ? Colors.white
                      : Colors.black),
              label: AppStrings.finish.tr(context)!);
        },
      ),
    );
  }
}