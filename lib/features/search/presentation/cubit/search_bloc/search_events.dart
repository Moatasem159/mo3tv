abstract class SearchEvents{}
class SearchEvent extends SearchEvents{
  final String query;
  SearchEvent(this.query);
}
class ClearEvent extends SearchEvents{}