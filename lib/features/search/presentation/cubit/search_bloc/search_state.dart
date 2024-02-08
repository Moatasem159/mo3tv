part of'search_bloc.dart';
abstract class SearchStates {}
class SearchInitialState extends SearchStates {}
class SearchLoadingState extends SearchStates {}
class SearchSuccessState extends SearchStates {
  final List<Search> items;
  SearchSuccessState(this.items);
}
class SearchSuccessEmptyState extends SearchStates {}
class SearchErrorState extends SearchStates {}
