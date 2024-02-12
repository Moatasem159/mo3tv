part of'../../../screens/genres_screen.dart';
class _KeywordsList extends StatefulWidget {
  final bool isMovie;
  const _KeywordsList(this.isMovie);
  @override
  State<_KeywordsList> createState() => _KeywordsListState();
}
class _KeywordsListState extends State<_KeywordsList> {
  late List<String> genresList;
  @override
  void initState() {
    if(widget.isMovie){
      genresList=[
        "Action",
        "Adventure",
        "Animation",
        "Comedy",
        "Crime",
        "Documentary",
        "Drama",
        "Family",
        "Fantasy",
        "History",
        "Horror",
        "Music",
        "Mystery",
        "Romance",
        "Science Fiction",
        "TV Movie",
        "Thriller",
        "War",
      ];
    }
    else{
      genresList=[
        "Action & Adventure",
        "Animation",
        "Comedy",
        "Crime",
        "Documentary",
        "Drama",
        "Family",
        "Kids",
        "Mystery",
        "News",
        "Reality",
        "Sci-Fi & Fantasy",
        "Talk",
        "War & Politics",
      ];
    }
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!AppLocalizations.of(context)!.isEnLocale) {
      if(widget.isMovie)
      {
        genresList=[
          "حركة",
          "مغامرة",
          "رسوم متحركة",
          "كوميديا",
          "جريمة",
          "وثائقي",
          "دراما",
          "عائلي",
          "فانتازيا",
          "تاريخ",
          "رعب",
          "موسيقى",
          "غموض",
          "رومنسية",
          "خيال علمي",
          "فيلم تلفازي",
          "إثارة",
          "حرب",
        ];
      }
      else{
        genresList=[
          "حركة ومغامرة",
          "رسوم متحركة",
          "كوميديا",
          "جريمة",
          "وثائقي",
          "دراما",
          "عائلي",
          "أطفال",
          "غموض",
          "أخبار",
          "واقع",
          "خيال علمي وفانتازيا",
          "حوار",
          "حرب وسياسة",
        ];
      }
    }
  }
  @override
  void dispose() {
    genresList.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 13,
      width: context.width,
      child: ListView.builder(
        itemCount:genresList.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (_, index)=>_KeyWordWidget(genresList[index],widget.isMovie),
      ),
    );
  }
}