part of'get_more_media_cubit.dart';
abstract class GetMoreMediaStates {}
class GetMoreMediaInitialState extends GetMoreMediaStates {}
class GetMoreMediaLoadingState extends GetMoreMediaStates{}
class GetMoreMediaSuccessState extends GetMoreMediaStates{
  final bool isLast;
  GetMoreMediaSuccessState(this.isLast);
}
class GetMoreMediaErrorState extends GetMoreMediaStates{}