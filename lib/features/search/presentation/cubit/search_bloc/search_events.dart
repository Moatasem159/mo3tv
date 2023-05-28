abstract class SearchEvents{}
class SearchEvent extends SearchEvents{
  final String query;
  final String lang;
  SearchEvent(this.query,this.lang);
}
class ClearEvent extends SearchEvents{}