part of'../../../screens/genres_screen.dart';
class _KeyWordWidget extends StatelessWidget {
  final String genre;
  final bool isMovie;
  const _KeyWordWidget(this.genre, this.isMovie);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(
      builder: (context, state) {
        GenresCubit cubit = GenresCubit.get(context);
        return GestureDetector(
          onTap: () => cubit.addToList(isMovie: isMovie, genre: genre),
          child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxWidth: 130,minWidth: 50),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                    color: (isMovie && cubit.movieGenres.contains(genre))
                        ? Colors.blue
                        : !isMovie && cubit.tvGenres.contains(genre)
                            ? Colors.blue
                            : Colors.white54,
                    width: 2),
            color: Colors.black54),
        child: Text(genre,textAlign: TextAlign.center, style: AppTextStyles.get14BoldText()),
      ),
        );
      },
    );
  }
}