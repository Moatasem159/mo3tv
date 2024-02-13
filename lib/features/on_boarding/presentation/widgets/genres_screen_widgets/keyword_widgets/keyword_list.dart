part of'../../../screens/genres_screen.dart';
class _KeywordsList extends StatefulWidget {
  final bool isMovie;
  const _KeywordsList(this.isMovie);
  @override
  State<_KeywordsList> createState() => _KeywordsListState();
}
class _KeywordsListState extends State<_KeywordsList> {
  late List<Keyword> genresList;
  @override
  void initState() {
    if(widget.isMovie){
      genresList = [
        const Keyword(name: "Action", id: 28),
        const Keyword(name: "Adventure", id: 12),
        const Keyword(name: "Animation", id: 16),
        const Keyword(name: "Comedy", id: 35),
        const Keyword(name: "Crime", id: 80),
        const Keyword(name: "Documentary", id: 99),
        const Keyword(name: "Drama", id: 18),
        const Keyword(name: "Family", id: 10751),
        const Keyword(name: "Fantasy", id: 14),
        const Keyword(name: "History", id: 36),
        const Keyword(name: "Horror", id: 27),
        const Keyword(name: "Music", id: 10402),
        const Keyword(name: "Mystery", id: 9648),
        const Keyword(name: "Romance", id: 10749),
        const Keyword(name: "Science Fiction", id: 878),
        const Keyword(name: "TV Movie", id: 10770),
        const Keyword(name: "Thriller", id: 53),
        const Keyword(name: "War", id: 10752),
      ];
    }
    else{
      genresList=[
        const Keyword(id: 10759, name: "Action & Adventure"),
        const Keyword(id: 16, name: "Animation"),
        const Keyword(id: 35, name: "Comedy"),
        const Keyword(id: 80, name: "Crime"),
        const Keyword(id: 99, name: "Documentary"),
        const Keyword(id: 18, name: "Drama"),
        const Keyword(id: 10751, name: "Family"),
        const Keyword(id: 10762, name: "Kids"),
        const Keyword(id: 9648, name: "Mystery"),
        const Keyword(id: 10763, name: "News"),
        const Keyword(id: 10764, name: "Reality"),
        const Keyword(id: 10765, name: "Sci-Fi & Fantasy"),
        const Keyword(id: 10767, name: "Talk"),
        const Keyword(id: 10768, name: "War & Politics"),
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
          const Keyword(id: 28, name: "حركة"),
          const Keyword(id: 12, name: "مغامرة"),
          const Keyword(id: 16, name: "رسوم متحركة"),
          const Keyword(id: 35, name: "كوميديا"),
          const Keyword(id: 80, name: "جريمة"),
          const Keyword(id: 99, name: "وثائقي"),
          const Keyword(id: 18, name: "دراما"),
          const Keyword(id: 10751, name: "عائلي"),
          const Keyword(id: 14, name: "فانتازيا"),
          const Keyword(id: 36, name: "تاريخ"),
          const Keyword(id: 27, name: "رعب"),
          const Keyword(id: 10402, name: "موسيقى"),
          const Keyword(id: 9648, name: "غموض"),
          const Keyword(id: 10749, name: "رومنسية"),
          const Keyword(id: 878, name: "خيال علمي"),
          const Keyword(id: 10770, name: "فيلم تلفازي"),
          const Keyword(id: 53, name: "إثارة"),
          const Keyword(id: 10752, name: "حرب"),
        ];
      }
      else{
        genresList=[
          const Keyword(id: 10759, name: "حركة ومغامرة"),
          const Keyword(id: 16, name: "رسوم متحركة"),
          const Keyword(id: 35, name: "كوميديا"),
          const Keyword(id: 80, name: "جريمة"),
          const Keyword(id: 99, name: "وثائقي"),
          const Keyword(id: 18, name: "دراما"),
          const Keyword(id: 10751, name: "عائلي"),
          const Keyword(id: 10762, name: "أطفال"),
          const Keyword(id: 9648, name: "غموض"),
          const Keyword(id: 10763, name: "أخبار"),
          const Keyword(id: 10764, name: "واقع"),
          const Keyword(id: 10765, name: "خيال علمي وفانتازيا"),
          const Keyword(id: 10767, name: "حوار"),
          const Keyword(id: 10768, name: "حرب وسياسة"),
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