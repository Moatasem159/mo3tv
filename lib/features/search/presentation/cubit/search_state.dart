
abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}
class SearchLoadingState extends SearchStates {}
class SearchSuccessState extends SearchStates {}
class SearchErrorState extends SearchStates {}
class SearchClearLoadingState extends SearchStates {}
class SearchClearSuccessState extends SearchStates {}
